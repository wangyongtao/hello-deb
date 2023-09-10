NAME="hello-deb"
VERSION=1.0.1
DATE=`date +%FT%T%z`

default:
	@echo "Date: $(DATE)"
	@echo "Hello, World"

show:
	@echo "-----------------------"
	@echo "NAME: $(NAME)"
	@echo "VERSION: $(VERSION)"
	@echo "Date: $(DATE)"
	@echo "Path: $(shell pwd)"
	@echo "-----------------------"

build-go:
	go build -o $(NAME)

build-deb:
	which dpkg-deb || { echo "dpkg-deb not exist, exit ..."; exit 1; }
	mkdir -p release/$(NAME)-$(VERSION)
	mkdir -p release/$(NAME)-$(VERSION)/usr/local/bin
	mkdir -p release/$(NAME)-$(VERSION)/etc/hello-deb
	cp -r DEBIAN release/$(NAME)-$(VERSION)/
	chmod -R 755 release/$(NAME)-$(VERSION)/
	cp -r etc/*.json release/$(NAME)-$(VERSION)/etc/hello-deb/
	GOOS=linux go build -o release/$(NAME)-$(VERSION)/usr/local/bin/${NAME}
	dpkg-deb --build release/$(NAME)-$(VERSION)
