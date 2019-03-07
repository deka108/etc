# [Go](https://golang.org/)

## Version Management

[gvm](https://github.com/moovweb/gvm)

### Installation

```bash
brew install mercurial
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

## Installing Go

`gvm install go` or `brew install go`

## Dependency Management

Preferred Tool: [Go Modules](https://github.com/golang/go/wiki/Modules) -- `go mod`

How to Use:

```go mod init```

## CLI Development

Preferred Tool: [Cobra](https://github.com/spf13/cobra)

## Building

`go build`

## Testing

Preferred Tool: [Go Test](https://docs.pytest.org/en/latest/)

Additional Tools:

- [stretchr/testify](https://github.com/stretchr/testify): easy test assertions

Documentations:

- https://golang.org/pkg/testing/

## IDE

Preferred Tool: [Visual Studio Code](https://code.visualstudio.com/)

### Package Dependencies for Go Development in Visual Code

Follow this guideline: https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on

```bash
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/alecthomas/gometalinter
gometalinter --install
```

| Package | Usage | How to Install |
| --- | --- | --- |
| [gocode](https://github.com/mdempsky/gocode) | auto-completion | `go get -u github.com/mdempsky/gocode` |
| [go-outline](https://github.com/ramya-rao-a/go-outline) | symbol search in the current file | `go get -u github.com/ramya-rao-a/go-outline` |
| [go-symbols](https://github.com/acroca/go-symbols) | symbol search in the workspace | `go get -u github.com/newhook/go-symbols` |
| [gopkgs](https://github.com/uudashr/gopkgs) | auto-completion of unimported packages | `go get -u github.com/uudashr/gopkgs/cmd/gopkgs` |
| [gogetdoc](https://github.com/zmb3/gogetdoc) | Go to symbol Definition or display documentation on hover | `go get -u https://github.com/zmb3/gogetdoc` |
| [golangci-lint](https://github.com/golangci/golangci-lint) | linting in Go | `go get -u github.com/golangci/golangci-lint/cmd/golangci-lint` |
| [dlv](https://github.com/derekparker/delve/tree/master/cmd/dlv) | debugging | `go get -u github.com/go-delve/delve/cmd/dlv` |