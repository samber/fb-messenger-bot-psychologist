# Messenger Bot talking as a "psychologist"

Based on Emacs doctor mode ;-)

## Setup

Follow the Facebook [Developer Documentation](https://developers.facebook.com/docs/messenger-platform/product-overview/setup) to setup your Facebook App.

## Run

```
docker build -t samber/doctor .
docker run --rm -i -p 8080:8080 \
       	   -e MESSENGER_APP_SECRET=******************* \
	   -e MESSENGER_VALIDATION_TOKEN=************* \
	   -e MESSENGER_PAGE_ACCESS_TOKEN=************ \
       	   samber/doctor
```

## Architecture

- The AI is based on the Emacs Doctor Mode. It has been developed more than 30y ago in ELisp (Emacs-Lisp), like every Emacs module. The ```doctor.el``` package can be easily extracted of Emacs source code and included in your own script.
- ```doctor.el``` used to parse Emacs buffer, so we needed to exchange messages from std(in|out).
- The Emacs Doctor is able to store your conversation in an history and rotate "hard-coded" answers, to give sense of "human relations". So you need to keep an Emacs Doctor instance up, for each single conversation.
- Facebook app standard permissions allow you only 24h sessions to discuss with somebody through Messenger. Then, killing Emacs instance after 24h of inactivity could make sense.

## License

Copyright (c) Samuel BERTHE Licensed under the MIT license.
