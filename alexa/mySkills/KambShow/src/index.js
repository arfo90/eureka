'use strict';

//const Alexa = require('alexa-sdk');

const handlers = {
    //Use LaunchRequest, instead of NewSession if you want to use the one-shot model
    // Alexa, ask [my-skill-invocation-name] to (do something)...
    'LaunchRequest': function () {
        this.attributes.speechOutput = this.t('WELCOME_MESSAGE', this.t('SKILL_NAME'));
        // If the user either does not reply to the welcome message or says something that is not
        // understood, they will be prompted again with this text.
        this.attributes.repromptSpeech = this.t('WELCOME_REPROMPT');

        this.response.speak(this.attributes.speechOutput).listen(this.attributes.repromptSpeech);
        this.emit(':responseReady');
    }
};


function handler(event){
    eventName = event["request"]["intent"]["name"];
    var resp = '';
    if(eventName == 'AMAZON.PauseIntent'){
        resp = pauseCommand(event);
    } else if (eventName == 'AMAZON.StopIntent') {
        resp = StopCommand(event);
    } else {
        resp = PlayCommand();
    }
    return resp;
}

function pauseCommand(event){
    var resp = {
    version: "1.0",
    response: {
        directives: [{
            type: 'AudioPlayer.PlaybackNearlyFinished',
            playBehavior: 'REPLACE_ALL',
            token: '1234-trak2',
            offsetInMilliseconds: 0,
            requestId: event["request"]["requestId"],
            timestamp: event["request"]["timestamp"],
            local: event["request"]["locale"],
            }
        ]}
    };
    return resp;
}

function StopCommand(event){
    var resp = {
    version: "1.0",
    response: {
        directives: [{
            type: 'AudioPlayer.PlaybackNearlyFinished',
            playBehavior: 'REPLACE_ALL',
            token: '1234-trak2',
            offsetInMilliseconds: 0,
            requestId: event["request"]["requestId"],
            timestamp: event["request"]["timestamp"],
            local: event["request"]["locale"],
            }
        ]}
    };
    return resp;
}

exports.handler = (event, context, callback) => {
    
    //   const alexa = Alexa.handler(event, context, callback);
   // alexa.APP_ID = 'amzn1.ask.skill.b1533c4d-d337-4252-9d9b-4dc9388e29c9';
    
    
    
    var resp = {
    version: "1.0",
    response: {
        directives: [{
            type: 'AudioPlayer.Play',
            playBehavior: 'REPLACE_ALL',
            audioItem: {
                stream: {
                    token: '1234-trak2',
                    url: 'https://s3.amazonaws.com/kambiz-show/shows/b29d50f7-8926-499a-9218-4b936df60956.mp3',
                    offsetInMilliseconds: 0,
                }
            }
            }
        ],
        
        shouldEndSession: 'True'
    }
    }
    //event["request"]["intent"]["name"]
    callback(null,event["request"]);
};