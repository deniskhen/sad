// полифилл для matches
if (!Element.prototype.matches) {
  Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector;
}

// полифилл для closest
if (!Element.prototype.closest) {
  Element.prototype.closest = function(s) {
    let el = this;
    do {
      if (Element.prototype.matches.call(el, s)) return el;
      el = el.parentElement || el.parentNode;
    } while (el !== null && el.nodeType === 1);
    return null;
  };
}

function getDateTime() {
  const now = new Date();
  return `${now.toLocaleString()} GMT ${(-now.getTimezoneOffset() < 0 ? '-' : '+')}${Math.abs(now.getTimezoneOffset() / 60)}`;
}

class SimpleChatbot {
  constructor(config) {
    if (!config.root) {
      throw new Error('SimpleChatbot: ключ root должен присутствовать в передаваемых данных');
    }
    if (!config.replicas) {
      throw new Error('SimpleChatbot: ключ replicas должен присутствовать в передаваемых данных');
    }
    this._$root = config.root;
    this._replicas = config.replicas;
    this._url = config.url || '/chatbot/chatbot.php';
    this._key = config.key || 'fingerprint';
    this._delay = 500;
    this._botIndex = 0;
    this._contentIndex = 1;
    this._start = true;
    this._params = {};
    this._active = false;
    this._addEventListener();
  }

  init() {
    if (this._active) {
      return;
    }
    this._active = true;
    const replicasJson = localStorage.getItem('chatbot');
    if (replicasJson) {
      const replicas = JSON.parse(replicasJson);
      this._params = replicas.params;
      this._botIndex = replicas.botIndex;
      let html = replicas.data.map(replica => SimpleChatbot.templateItem(replica));
      const $container = this._$root.querySelector('.chatbot__items');
      $container.insertAdjacentHTML('beforeend', html.join(''));
      this._outputContent(0);
    } else {
      this._outputContent(this._delay);
    }
  }

  reset() {
    SimpleChatbot.resetTemplate();
    this._botIndex = 0;
    this._contentIndex = 1;
    this._start = true;
    this._params = {};
    this._active = false;
    localStorage.removeItem('chatbot');
    this.init();
  }

  _template(type, content, state = '') {
    return `<div class="chatbot__item chatbot__item_${type}"><div class="chatbot__content chatbot__content_${type}${state}">${content}</div></div>`;
  }

  _templateBtn(botIndex, content) {
    return `<button class="btn" type="button" data-bot-index="${botIndex}">${content}</button>`;
  }

  _getData(target, id) {
    const chatObj = this._replicas[target];
    return chatObj[id.toString()];
  }

  _outputContent(interval) {
    const botData = this._getData('bot', this._botIndex);
    const humanIds = botData.human;
    const $container = this._$root.querySelector('.chatbot__items');
    let botContent = botData.content;
    if (Array.isArray(botContent)) {
      botContent = botContent.map(content => {
        for (const key in this._params) {
          content = content.split(`{{${key}}}`).join(this._params[key]);
        }
        return content;
      });
    } else {
      for (const key in this._params) {
        botContent = botContent.split(`{{${key}}}`).join(this._params[key]);
      }
    }

    const fn2 = () => {
      if (this._getData('human', humanIds[0]).content === '') {
        this._$root.querySelector('.chatbot__input').disabled = false;
        this._$root.querySelector('.chatbot__input').dataset.name = this._getData('human', humanIds[0]).name;
        this._$root.querySelector('.chatbot__submit').disabled = true;
        this._$root.querySelector('.chatbot__input').focus();
        this._$root.querySelector('.chatbot__submit').dataset.botIndex = this._getData('human', humanIds[0]).bot;
      } else {
        this._$root.querySelector('.chatbot__input').value = '';
        this._$root.querySelector('.chatbot__input').disabled = true;
        this._$root.querySelector('.chatbot__submit').disabled = true;
        const $humanContent = humanIds.map(id => {
          const humanData = this._getData('human', id);
          return this._templateBtn(humanData.bot, humanData.content);
        });
        const $humanContentWrapper = this._template('human', $humanContent.join(''));
        $container.insertAdjacentHTML('beforeend', $humanContentWrapper);
        $container.scrollTop = $container.scrollHeight;
      }
    };

    if (interval) {
      let times = 1;
      if (Array.isArray(botContent)) {
        botContent.forEach(content => {
          const $botContent = this._template('bot', content);
          window.setTimeout(() => {
            $container.insertAdjacentHTML('beforeend', $botContent);
            $container.scrollTop = $container.scrollHeight;
          }, interval * times);
          times++;
        });
      } else {
        const $botContent = this._template('bot', botContent);
        window.setTimeout(() => {
          $container.insertAdjacentHTML('beforeend', $botContent);
          $container.scrollTop = $container.scrollHeight;
        }, interval * times);
        times++;
      }
      window.setTimeout(() => {
        fn2();
      }, interval * times);
    } else {
      if (Array.isArray(botContent)) {
        botContent.forEach(content => {
          const $botContent = this._template('bot', content);
          $container.insertAdjacentHTML('beforeend', $botContent);
          $container.scrollTop = $container.scrollHeight;
        });
      } else {
        const $botContent = this._template('bot', botContent);
        $container.insertAdjacentHTML('beforeend', $botContent);
        $container.scrollTop = $container.scrollHeight;
      }
      fn2();
    }
  }

  _humanResponseToDisabled($target) {
    const $container = $target.closest('.chatbot__content_human');
    const content = $target.innerHTML;
    $container.innerHTML = content;
    $container.classList.remove('chatbot__content_human');
    $container.classList.add('chatbot__content_human-disabled');
    return content;
  }

  _addToChatHumanResponse(humanContent) {
    const $container = this._$root.querySelector('.chatbot__items');
    const $humanContent = this._template('human', humanContent, '-disabled');
    $container.insertAdjacentHTML('beforeend', $humanContent);
    $container.scrollTop = $container.scrollHeight;
  }

  async _eventHandlerClick(e) {
    const $target = e.target;
    const botIndex = $target.dataset.botIndex;
    const url = this._url;
    const data = {};
    let humanContent = '';
    let humanField = '';

    if ($target.closest('.chatbot__submit')) {
      if ($target.closest('.chatbot__submit').disabled) {
        return;
      }
      $target.closest('.chatbot__submit').disabled = true;
      if (!this._$root.querySelector('.chatbot__input').value.length) {
        return;
      }
      this._botIndex = +$target.closest('.chatbot__submit').dataset.botIndex;
      humanContent = this._$root.querySelector('.chatbot__input').value;
      humanField = this._$root.querySelector('.chatbot__input').dataset.name;
      if (humanField) {
        this._params[humanField] = humanContent;
      }
      this._addToChatHumanResponse(humanContent);
      this._outputContent(this._delay);
    } else if (botIndex) {
      this._botIndex = +botIndex;
      humanContent = this._humanResponseToDisabled($target);
      this._outputContent(this._delay);
    } else if ($target.classList.contains('chatbot__close')) {
      $target.closest('.chatbot').classList.add('chatbot_hidden');
      document.querySelector('.chatbot__btn').classList.remove('d-none');
      return;
    } else if ($target.classList.contains('chatbot__reset')) {
      this.reset();
      return;
    } else {
      return;
    }
    e.preventDefault();

    const $botWrapper = document.querySelectorAll('.chatbot__item_bot');
    const $botWrapperLast = $botWrapper[$botWrapper.length - 1];
    let $prev = $botWrapperLast;
    let $first = $prev;
    while ($prev) {
      if (!$prev.classList.contains('chatbot__item_bot')) {
        break;
      }
      $first = $prev;
      $prev = $prev.previousElementSibling;
    }
    let $botContent = $first;
    while ($botContent) {
      if (!$botContent.classList.contains('chatbot__item_bot')) {
        break;
      }
      const $botItems = $botContent.querySelectorAll('.chatbot__content');
      for (let i = 0, length = $botItems.length; i < length; i++) {
        data[this._contentIndex] = {
          type: 'bot',
          content: $botItems[i].innerHTML,
        };
        this._contentIndex++;
      }
      $botContent = $botContent.nextElementSibling;
    }
    data[this._contentIndex] = {
      type: 'human',
      content: humanContent,
    };
    this._contentIndex++;

    let fromStorage = localStorage.getItem('chatbot');
    let dataToStorage = [];
    let paramsJSON = {};
    if (fromStorage) {
      dataToStorage = JSON.parse(fromStorage).data;
      paramsJSON = JSON.parse(fromStorage).params;
    }
    for (let key in data) {
      dataToStorage.push({
        type: data[key].type,
        content: data[key].content,
      });
    }
    if (humanField) {
      paramsJSON[humanField] = humanContent;
    }
    const dataToStorageJSON = JSON.stringify({
      botIndex: this._botIndex,
      data: dataToStorage,
      params: paramsJSON,
    });
    localStorage.setItem('chatbot', dataToStorageJSON);

    const dataSend = JSON.stringify({
      id: localStorage.getItem(this._key),
      chat: data,
      start: this._start,
      date: getDateTime(),
    });
    this._start = false;

    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        },
        body: dataSend,
      });
      if (response.ok) {
        //console.log(await response.json());
      } else {
        //console.log('error');
      }
    } catch (error) {
      //console.log(error);
    }
  }

  _eventHandlerKeydown(e) {
    const $target = e.target;
    if (!$target.classList.contains('chatbot__input')) {
      return;
    }
    const btnSubmit = this._$root.querySelector('.chatbot__submit');
    if ($target.value.length > 0) {
      btnSubmit.disabled = false;
    } else {
      btnSubmit.disabled = true;
    }
  }

  _addEventListener() {
    this._$root.addEventListener('click', this._eventHandlerClick.bind(this));
    this._$root.addEventListener('input', this._eventHandlerKeydown.bind(this));
    this._$root.addEventListener('keypress', function(e) {
      if (e.key === 'Enter' && e.target.classList.contains('chatbot__input')) {
        const $submit = e.target.closest('.chatbot').querySelector('.chatbot__submit');
        $submit.click();
      }
    });
  }

  static templateItem(replicas) {
    let html = '<div class="chatbot__item chatbot__item_{{type}}"><div class="chatbot__content chatbot__content_{{type}}{{state}}">{{content}}</div></div>';
    html = html.replace('{{type}}', replicas.type);
    html = html.replace('{{type}}', replicas.type);
    html = html.replace('{{state}}', replicas.type === 'bot' ? '' : '-disabled');
    html = html.replace('{{content}}', replicas.content);
    return html;
  }

  static resetTemplate() {
    const $root = document.querySelector('.chatbot');
    if (!$root) {
      return;
    }
    $root.innerHTML = '<div class="chatbot__title"><span class="chatbot__close"></span>Chatbot<span class="chatbot__reset"></span></div><div class="chatbot__wrapper"><div class="chatbot__items"></div></div><div class="chatbot__footer"><input class="chatbot__input" type="text" disabled><button class="chatbot__submit" type="button" disabled></button></div>';
  }

  static createTemplate() {
    let $root = document.querySelector('.chatbot');
    if ($root) {
      return $root;
    }
    const $fragment = document.createElement('div');
    $fragment.className = 'chatbot chatbot_hidden';
    $fragment.innerHTML = '<div class="chatbot__title"><span class="chatbot__close"></span>Chatbot<span class="chatbot__reset"></span></div><div class="chatbot__wrapper"><div class="chatbot__items"></div></div><div class="chatbot__footer"><input class="chatbot__input" type="text" disabled><button class="chatbot__submit" type="button" disabled></button></div>';
    document.body.appendChild($fragment);
    return document.querySelector('.chatbot');
  }
}
