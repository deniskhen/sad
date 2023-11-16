// конфигурация чат-бота
const configChatbot = {};
// CSS-селектор кнопки, посредством которой будем вызывать окно диалога с чат-ботом
configChatbot.btn = '.chatbot__btn';
// ключ для хранения отпечатка браузера
configChatbot.key = 'fingerprint';
// реплики чат-бота
configChatbot.replicas = '/chatbot/data/data-1.json';
// корневой элемент
configChatbot.root = SimpleChatbot.createTemplate();
// URL chatbot.php
configChatbot.url = '/chatbot/chatbot.php';
// переменная для хранения экземпляра
let chatbot = null;
// добавление ключа для хранения отпечатка браузера в LocalStorage
let fingerprint = localStorage.getItem(configChatbot.key);
if (!fingerprint) {
  Fingerprint2.get(function (components) {
    fingerprint = Fingerprint2.x64hash128(components.map(function (pair) {
      return pair.value;
    }).join(), 31);
    localStorage.setItem(configChatbot.key, fingerprint);
  });
}
// при клике по кнопке configChatbot.btn
document.querySelector(configChatbot.btn).onclick = function (e) {
  this.classList.add('d-none');
  const $tooltip = this.querySelector('.chatbot__tooltip');
  if ($tooltip) {
    $tooltip.classList.add('d-none');
  }
  configChatbot.root.classList.toggle('chatbot_hidden');
  if (chatbot) {
    return;
  }
  // получение json-файла, содержащего сценарий диалога для чат-бота через Fetch API
  fetch(configChatbot.replicas)
    .then(response => response.json())
    .then(data => {
      // для поддержки IE11
      if (typeof data === 'string') {
        configChatbot.replicas = JSON.parse(data);
      } else {
        configChatbot.replicas = data;
      }
      // инициализация SimpleChatbot
      chatbot = new SimpleChatbot(configChatbot);
      chatbot.init();
    })
    .catch(error => console.log(error));
};