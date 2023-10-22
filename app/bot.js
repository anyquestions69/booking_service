const TelegramBot = require('node-telegram-bot-api');
//Инициализируем переменные из .env
require('dotenv').config();
const bot = new TelegramBot(process.env.API_KEY_BOT, {

    polling: true
    
});
const commands = [

    {command: "start", description: "Запуск бота"},
    {command: "help", description: "Раздел помощи"},
    {command: "add", description: "Новый ивент"},
    {command: "change_price", description: "Изменить цену на билеты"},
    {command: 'second_menu', description: "Второе меню"}

]
bot.setMyCommands(commands);

bot.on('text', async msg => {

    try {

        //Обрабатываем запуск бота
        if(msg.text.startsWith('/start')) {
            
            //Приветственное сообщение
            await bot.sendMessage(msg.chat.id, `Вы запустили бота! 👋🏻`);

            //Проверяем, был ли запущен бот по ссылке из раздела /ref
            if(msg.text.length > 6) {
                //Получаем ID из параметров запуска бота
                const refID = msg.text.slice(7);
                //Если человек зашёл по ref-ссылке, то ему придёт сообщение с информацией об этом
                await bot.sendMessage(msg.chat.id, `Вы зашли по ссылке пользователя с ID ${refID}`);

            }

        }
        else if(msg.text == '/add') {

            //Делаем ссылку на запуск в бота, в которой передаём ID пользователя
            await bot.sendMessage(msg.chat.id, `Укажите название ивента: `);

        }
        else if(msg.text == '/help') {

            //Пример HTML-стилизации текста
            await bot.sendMessage(msg.chat.id, `Раздел помощи HTML\n\n<b>Жирный Текст</b>\n<i>Текст Курсивом</i>\n<code>Текст с Копированием</code>\n<s>Перечеркнутый текст</s>\n<u>Подчеркнутый текст</u>\n<pre language='c++'>код на c++</pre>\n<a href='t.me'>Гиперссылка</a>`, {

                parse_mode: "HTML"

            });

            //Пример Markdown-стилизации текста
            await bot.sendMessage(msg.chat.id, 'Раздел помощи Markdown\n\n*Жирный Текст*\n_Текст Курсивом_\n`Текст с Копированием`\n~Перечеркнутый текст~\n``` код ```\n||скрытый текст||\n[Гиперссылка](t.me)', {

                parse_mode: "MarkdownV2"

            });

        }
        else if(msg.text == '/\/name (.+)\n\r\//') {

            await bot.sendMessage(msg.chat.id, `https://habr.com/`, {

                //Выключаем превью ссылки в сообщении
                disable_web_page_preview: true,
                //Отключаем уведомление о сообщении для пользователя
                disable_notification: true

            });

        }
        else if(msg.text == '/vrv') {

            await bot.sendMessage(msg.chat.id, `Меню бота`, {

                reply_markup: {
                    //Добавляем пользователю меню-клавиатуру
                    keyboard: [

                        ['⭐️ Картинка', '⭐️ Видео'],
                        ['⭐️ Аудио', '⭐️ Голосовое сообщение'],
                        [{text: '⭐️ Контакт', request_contact: true}, {text: '⭐️ Геолокация', request_location: true}],
                        ['❌ Закрыть меню']

                    ],
                    //Подгоняем размер меню-клавиатуры
                    resize_keyboard: true

                }

            })

        }
        else if(msg.text == '/second_menu') {

            await bot.sendMessage(msg.chat.id, `Второе меню`, {

                reply_markup: {
                    //Добавляем инлайн-клавиатуру
                    inline_keyboard: [

                        [{text: 'Стикер', callback_data: 'sticker'}, {text: 'Круглое Видео', callback_data: 'circleVideo'}],
                        [{text: 'Купить Файл', callback_data: 'buyFile'}],
                        [{text: 'Проверить Подписку', callback_data: 'checkSubs'}],
                        [{text: 'Закрыть Меню', callback_data: 'closeMenu'}]

                    ]

                },
                //Сообщение будет ответом на сообщение пользователя
                reply_to_message_id: msg.message_id

            })

        }
        else if(msg.text == '❌ Закрыть меню') {

            await bot.sendMessage(msg.chat.id, 'Меню закрыто', {

                reply_markup: {
                    //Выключаем клавиатуру у пользователя
                    remove_keyboard: true

                }

            })

        }
        else {

            //Отправляем пользователю сообщение
            const msgWait = await bot.sendMessage(msg.chat.id, `Бот генерирует ответ...`);

            //Через 5 секунд редактируем сообщение о генерации и вставляем туда сообщение пользователя (эхо-бот)
            setTimeout(async () => {

                await bot.editMessageText(msg.text, {

                    chat_id: msgWait.chat.id,
                    message_id: msgWait.message_id

                });

            }, 5000);

        }

    }
    catch(error) {

        console.log(error);

    }

})
