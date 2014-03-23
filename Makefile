ROOT=$(shell pwd)

# Global Tasks
###
clean: clean/locomotive clean/nombo clean/socketstream
	-rm -rf node_modules

# Connect
###
connect: node_modules/connect .PHONY
	node connect

node_modules/connect:
	npm install connect

clean/connect: .PHONY
	-rm -rf node_modules/connect

# Express
###
express: node_modules/express .PHONY
	node express

node_modules/express:
	npm install express

clean/express: .PHONY
	-rm -rf node_modules/express
	-rm node_modules/.bin/express

# Geddy
###
geddy: node_modules/geddy/.bin/geddy .PHONY
	cd geddy; ../node_modules/.bin/geddy

node_modules/geddy/.bin/geddy:
	npm install geddy

clean/geddy: .PHONY
	-rm node_modules/.bin/geddy
	-rm -rf node_modules/geddy

# Flatiron
###
flatiron: node_modules/flatiron node_modules/union .PHONY
	node flatiron

node_modules/flatiron:
	npm install flatiron

node_modules/union:
	npm install union

clean/flatiron: .PHONY
	-rm -rf node_modules/flatiron
	-rm -rf node_modules/union
	-rm node_modules/.bin/flatiron

# Locomotive
###
locomotive: node_modules/locomotive/.bin/lcm locomotive/node_modules .PHONY
	cd locomotive; ./node_modules/.bin/lcm server

node_modules/locomotive/.bin/lcm:
	npm install locomotive

locomotive/node_modules:
	cd locomotive; npm install

clean/locomotive: .PHONY
	-rm -rf node_modules/locomotive
	-rm -rf node_modules/.bin/lcm
	-rm -rf locomotive/node_modules

# Nombo
###
nombo: node_modules/nombo/.bin/nombo .PHONY
	@# ensure nombo modules are installed correctly
	./node_modules/.bin/nombo create --force nombo
	node nombo/server.node 3000

node_modules/nombo/.bin/nombo:
	npm install nombo

clean/nombo: .PHONY
	-rm -rf node_modules/nombo
	-rm -rf node_modules/.bin/nombo

# partial.js
###
partial.js: node_modules/partial.js .PHONY
	cd partial.js; node index.js

node_modules/partial.js:
	npm install partial.js

clean/partial.js: .PHONY
	-rm -rf node_modules/partial.js
	-rm -rf node_modules/.bin/partial.js

# SocketStream
###
socketstream: node_modules/socketstream socketstream/node_modules .PHONY
	cd socketstream; node app.js

socketstream/node_modules:
	cd socketstream; npm install

node_modules/socketstream:
	npm install socketstream

clean/socketstream: .PHONY
	-rm -rf node_modules/socketstream
	-rm -rf node_modules/.bin/socketstream
	-rm -rf socketstream/node_modules

# Socket.IO
###
socket.io: node_modules/socket.io .PHONY
	node socket.io

node_modules/socket.io:
	npm install socket.io

clean/socket.io:
	-rm -rf node_modules/socket.io

# Spine
###
spine: .PHONY
	node spine

clean/spine:
	@echo "no clean actions required"

# Koa
###
koa: .PHONY
	# Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

#koa: node_modules/koa .PHONY
	@#node koa

#node_modules/koa:
	@#npm install koa

# Tower
###
tower: .PHONY
	# Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

#tower: node_modules/tower-router node_modules/koa .PHONY
	@#node tower

#node_modules/tower-router:
	@#npm install tower-router

#clean/tower: clean/koa
	@#-rm -rf node_modules/tower-router

.PHONY:

# vim: set ft=make ai sw=4 sts=4 ts=4 noexpandtab:
