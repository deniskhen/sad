<?php
function debug($data)
{
    echo '<pre>' . print_r($data, true) . '</pre>';
}

function get_sum_by_months(int $year): array
{
    global $pdo;
    $res = $pdo->query("SELECT MONTH(created_at) AS month_num, SUM(price) AS total FROM orders WHERE YEAR(created_at) = $year GROUP BY month_num");
    $data = [];
    while ($row = $res->fetch()) {
        $data[$row['month_num']] = $row['total'];
    }
    return $data;
}
