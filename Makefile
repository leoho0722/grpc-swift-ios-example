# 系統架構，amd64 或 arm64
ARCH ?= arm64

.PHONY: proto-gen-swift
proto-gen-swift:
ifeq ($(ARCH), arm64)
	/opt/homebrew/bin/protoc \
	--swift_out=. \
	--grpc-swift_out=. \
	grpc-swift-ios-example/Services/proto/*.proto
else
	/usr/local/bin/protoc \
	--swift_out=. \
	--grpc-swift_out=. \
	grpc-swift-ios-example/Services/proto/*.proto
endif
