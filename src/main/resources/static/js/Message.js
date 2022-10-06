/**
 * Message.js --- JavaScript code for connecting with backend for messaging.
 */

/*Static variables*/
let defaultConversationBody = document.querySelector("#noConvo");
let messageSubmit = document.querySelector("#messageSend");
let textArea = document.querySelector("#textareaId");
let header = document.querySelector("#chatheader");
let conversation = document.querySelector("#conversation-body");

/*STOMP client*/
let stompClient = null;

$("#textareaId").keypress(e => { /*event for submitting chat*/
    if (e.which === 13 && !e.shiftKey) {
        e.preventDefault();
        send();
  
    }
});

function selectUser(e) { /*main function for instantiating conversation*/

	disconnect();
	
    /*Messaging form and display*/
    let convoheaderElement = e.parentElement.parentElement.parentElement.firstElementChild;
    let defaultScreen = document.querySelector("#defaultMessage");
    let messageForm = document.querySelector("#messageform");

    receiver = e.id;
    defaultScreen.classList.add("d-none");
    header.classList.remove("d-none");
    messageForm.classList.remove("d-none");
    conversation.scrollTop = conversation.scrollHeight;

    var socket = new SockJS('/AbcCommunication');
    stompClient = Stomp.over(socket);
    stompClient.debug = null;
    stompClient.connect({}, onConnected, onStompError);

    if (header.children.length == 0) {
        header.appendChild(convoheaderElement.cloneNode(true));
    } else {
        header.replaceChild(convoheaderElement.cloneNode(true), header.firstElementChild);
    }

    retrieveAllConversation();
}

function retrieveAllConversation() { /*ajax call for retrieving chat history*/
    var recieverURL = "/chatUserSelect/" + receiver;
    let chatBubbles = document.querySelectorAll(".chat-messages");
    //console.log(chatBubbles);
    if (chatBubbles != null) {
        chatBubbles.forEach(chatBubble => {
            chatBubble.remove();
        });
    }
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            let messages = JSON.parse(xhr.responseText);
            //console.log(messages);
            if (messages.length === 0) {
                defaultConversationBody.classList.remove("d-none");

            } else {
                defaultConversationBody.classList.add("d-none");
                for (var i = 0; i < messages.length; i++) {
                	appendChatBubbles(messages[i]);
                }
            }
        }
    }
    xhr.open("GET", recieverURL, true);
    xhr.send(null);
}

function onConnected() {
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/chat', onMessageReceived);

}

function onStompError(error) {
	console.log('Could not connect to WebSocket server. Please refresh this page to try again!');
}

function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);
    if ((message.receiverId == receiver || message.receiverId == userId) 
    		&& (message.senderId == userId || message.senderId == receiver)){
    	 defaultConversationBody.classList.add("d-none");
    	appendChatBubbles(message);
    }
   
}

function send() {

    var messageContent = textArea.value.trim();
    if (messageContent && stompClient) {
        var chatMessage = {
            senderId: userId,
            msgBody: textArea.value,
            receiverId: receiver

        };

        stompClient.send("/app/chat.send", {}, JSON.stringify(chatMessage));
        textArea.value = '';
    }

}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

function appendChatBubbles(message){
    var messageBlock = document.createElement("div");
    var container = document.createElement("div");
    var containerForName = document.createElement("div");
    var containerForDate = document.createElement("div");
    var containerForMessage = document.createElement("div");
    var messageText = document.createElement("span");
    var timeStamp = document.createElement("span");
    var sender = document.createElement("span");

    //for message blocks
    messageBlock.classList.add("d-flex");
    messageBlock.classList.add("my-3");
    messageBlock.classList.add("chat-messages");
    //message bubble
    messageText.classList.add("px-3");
    messageText.classList.add("py-2");
    messageText.classList.add("rounded-pill");
    messageText.classList.add("border");

    //setup container
    container.classList.add("d-flex");
    container.classList.add("flex-column");

    //setup name container
    containerForName.classList.add("d-flex");

    //setup date container
    containerForDate.classList.add("d-flex");

    //setup message container
    containerForMessage.classList.add("d-flex");

    if (message.senderId == userId) {
        messageBlock.classList.add("justify-content-end");

        messageText.classList.add("bg-success");
        messageText.classList.add("text-light");

        containerForMessage.classList.add("justify-content-end");
        containerForName.classList.add("justify-content-end");
        containerForDate.classList.add("justify-content-end");

    } else {
        messageBlock.classList.add("justify-content-start");

        messageText.classList.add("bg-light");

        containerForMessage.classList.add("justify-content-start");
        containerForName.classList.add("justify-content-start");
        containerForDate.classList.add("justify-content-start");
    }

    //getting innerhtml
    timeStamp.innerHTML = message.dateSent;
    messageText.innerHTML = message.msgBody;
    sender.innerHTML = message.sender;
    sender.classList.add("fw-bold");
    //setting up
    containerForMessage.append(messageText);
    containerForName.append(sender);
    containerForDate.append(timeStamp);

    //collecting all container
    container.append(containerForName);
    container.append(containerForMessage);
    container.append(containerForDate);

    messageBlock.append(container);

    conversation.append(messageBlock);
    conversation.scrollTop = conversation.scrollHeight;
}