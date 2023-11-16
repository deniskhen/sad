<?php 
require __DIR__ . '/db.php'; 
require __DIR__ . '/funcs.php';

$years = get_unique_years();
function get_unique_years()
{
    // Подключение к базе данных
    $conn = new mysqli("localhost", "root", "", "company_website_db");

    // Проверка соединения
    if ($conn->connect_error) {
        die("Ошибка подключения к базе данных: " . $conn->connect_error);
    }

    // Запрос для получения уникальных годов
    $query = "SELECT DISTINCT YEAR(created_at) AS year FROM orders";

    // Выполнение запроса
    $result = $conn->query($query);

    // Проверка на наличие результатов
    if ($result->num_rows > 0) {
        $years = array();
        while ($row = $result->fetch_assoc()) {
            $years[] = $row['year'];
        }
        return $years;
    } else {
        return array();
    }

    // Закрытие соединения с базой данных
    $conn->close();
}

if (isset($_GET['get_months'])) {
   $type = $_GET['type'] ?? 'bar';
   $year = (int)$_GET['get_months'];
   $get_months = get_sum_by_months($year);
   $labels = implode(',', array_keys($get_months));
   $values = implode(',', $get_months);
   $label = 'Продажи по месяцам';
   $title = "Продажи за {$year} год";

   // Возвращаем данные в формате JSON
   echo json_encode([
      'labels' => $labels,
      'values' => $values,
      'type' => $type,
      'title' => $title
   ]);
   exit;
}
?>

<style>
   #charts{
      background-color: whitesmoke;
      margin: 3em;
      padding: 3em;
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
   }
   #myChart {
      width: 80vw;
   }
   #myTable {
      border-collapse: collapse;
      width: 80vw;
      margin-top: 2em;
   }
   #myTable th, #myTable td {
      border: 1px solid black;
      padding: 10px;
      text-align: center;
   }
   .btn {
      text-align: center;
   }
</style>

<section id="charts">
   <h1>Анализ данных за выбранный период</h1>
   <div class="col-md-12">
      <form id="chartForm">
         <div class="mb-3">
            <label for="get_months" class="form-label">Выберите год</label>
            <select class="form-select" aria-label="Default select example" name="get_months" id="get_months">
            <?php foreach ($years as $year) : ?>
                  <option value="<?= $year; ?>"><?= $year; ?></option>
            <?php endforeach; ?>
            </select>
         </div>
         <div class="mb-3">
            <label for="type" class="form-label">Тип вывода данных</label>
            <select class="form-select" aria-label="Default select example" name="type" id="type">
               <option value="bar">Столбчатая</option>
               <option value="line">Линейная</option>
               <option value="pie">Круговая</option>
               <option value="table">Таблица</option>
            </select>
         </div>
         <button type="submit" class="btn btn-primary">Показать</button>
      </form>
   </div>
   <div class="col-md-12">
      <canvas id="myChart"></canvas>
   </div>
   <div class="col-md-12">
      <table id="myTable"></table>
   </div> 
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <script>
      // Обработчик отправки формы
      document.getElementById('chartForm').addEventListener('submit', function(event) {
         event.preventDefault(); // Предотвращаем перезагрузку страницы
         // Отправляем Fetch-запрос на сервер для получения данных для графика
         fetch('./chart/graf.php?' + new URLSearchParams(new FormData(this)).toString())
            .then(response => response.json())
            .then(data => {
               // Обновляем график и таблицу с полученными данными
               if (data.type === 'table') {
                  updateTable(data.labels, data.values);
                  document.getElementById('myChart').style.display = 'none';
               } else {
                  updateChart(data.labels, data.values, data.type, data.title);
                  document.getElementById('myChart').style.display = 'block';
                  document.getElementById('myTable').innerHTML = '';
               }
            })
            .catch(error => console.error(error));
      }); 
      const months = [
            'Янв',
            'Фев',
            'Март',
            'Апр',
            'Май',
            'Июнь',
            'Июль',
            'Авг',
            'Сен',
            'Окт',
            'Нояб',
            'Дек'
         ];
      // Функция для обновления графика 
      function updateChart(labels, values, type, title) {
         const data = {
            labels: labels.split(',').sort(((a,b)=>a-b)).map(month => months[parseInt(month) - 1]),
            datasets: [{
               label: 'Данные анализа',
               backgroundColor: [
                  '#FF0000',
                  '#FF1493',
                  '#FF8C00',
                  '#FFFF00',
                  '#00FF00',
                  '#00FFFF',
                  '#0000FF',
                  '#800000',
                  '#808000',
                  '#008080',
                  '#000080',
                  '#F08080'
               ],
               borderColor: 'rgb(255, 99, 132)',
               hoverOffset: 4,
               data: values.split(','),
            }],
         };
         const config = {
            type: type,
            data: data,
            options: {
               indexAxis: 'x',
               plugins: {
                  legend: {
                     display: type === 'pie',
                     position: 'bottom'
                  },
                  title: {
                     display: true,
                     text: title
                  }
               }
            }
         };

         // Проверяем, существует ли уже график, и удаляем его, если да
         const existingChart = Chart.getChart('myChart');
         if (existingChart) {
            existingChart.destroy();
         }
         // Создаем новый график с обновленными данными
         const myChart = new Chart(
            document.getElementById('myChart'),
            config
         );
      }

      // Функция для обновления таблицы
      function updateTable(labels, values) {
         const table = document.getElementById('myTable');
         table.innerHTML = '';
         // Преобразуем строки в массивы
         labels = labels.split(',').sort(((a,b)=>a-b)).map(month => months[parseInt(month) - 1]);
         values = values.split(',');
         // Создаем массив объектов для сортировки
         const data = [];
         for (let i = 0; i < labels.length; i++) {
            data.push({ label: labels[i], value: values[i] });
         }
         // Сортируем данные по возрастанию
         data.sort((a, b) => a.label - b.label);
         // Создаем заголовок таблицы
         const thead = document.createElement('thead');
         const tr = document.createElement('tr');
         const th1 = document.createElement('th');
         th1.textContent = 'Месяц';
         const th2 = document.createElement('th');
         th2.textContent = 'Количество';
         tr.appendChild(th1);
         tr.appendChild(th2);
         thead.appendChild(tr);
         table.appendChild(thead);
         // Создаем строки таблицы
         const tbody = document.createElement('tbody');
         for (let i = 0; i < data.length; i++) {
            const tr = document.createElement('tr');
            const td1 = document.createElement('td');
            td1.textContent = data[i].label;
            const td2 = document.createElement('td');
            td2.textContent = data[i].value;
            tr.appendChild(td1);
            tr.appendChild(td2);
            tbody.appendChild(tr);
         }
         table.appendChild(tbody);
      }
   </script>
</section>
