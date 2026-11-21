# graiz/homebrew-tap

Homebrew formulas for [kb](https://github.com/graiz/kittybrowser), a web
browser that runs in a terminal pane.

```sh
brew install graiz/tap/kittybrowser
```

`brew upgrade kittybrowser` updates it.

## Releasing a new kb

After a kb release has finished building on GitHub:

```sh
./update.sh 0.2.0
git commit -am "kittybrowser 0.2.0" && git push
```
