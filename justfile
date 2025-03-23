[private]
default:
    just --list

watch:
    #!/usr/bin/env bash
    examples=$(ls examples/*/*.typ -1)
    echo "Will watch:"
    for example in $examples; do
        echo "  $example"
    done

    echo "$examples" | parallel --line-buffer --tag typst watch --root . {.}.typ {.}.pdf


install:
    #!/usr/bin/env bash
    package=$(grep '^name =' typst.toml | awk -F '"' '{print $2}')
    version=$(grep '^version =' typst.toml | awk -F '"' '{print $2}')

    echo "Installing to $HOME/.local/share/typst/packages/local/$package/$version"
    mkdir -p "$HOME/.local/share/typst/packages/local/$package/$version"
    rm -r "$HOME/.local/share/typst/packages/local/$package/$version/"
    rsync -a --exclude='.*' . "$HOME/.local/share/typst/packages/local/$package/$version/"