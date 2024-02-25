# setup-poetry

Shared GitHub Action to install and set up the [Poetry](https://python-poetry.org/) build tool for [Python](https://www.python.org/).  It is available in the [GitHub Marketplace](https://github.com/marketplace/actions/setup-and-install-poetry) at no cost.

## Design

This action is similar to [snok/install-poetry](https://github.com/snok/install-poetry), but it takes a slightly different approach.  It is also more opinionated, offering access to fewer of Poetry's underlying configuration options in favor of typical defaults.  Poetry >= 1.8.0 is installed using `pipx`, which is now the recommended installation method.

When using this action, the Poetry runtime, cache, and configuration directories as well as the project virtual environment are always created within the GitHub Actions workspace.  Poetry is installed and configured under `.poetry` and the virtualenv is created under `.venv`.  This has implications for some tools; for instance, you may need to configure code formatters like Black to ignore these two directories.

Unlike with the snok action, you are required to specify a version of Poetry to install.  The action will never install the latest version of Poetry by default.  You may also specify a list of Poetry plugins to install.

You may optionally cache the project virtual environment and/or the Poetry runtime and cache directories.  Caching is implemented via [actions/cache](https://github.com/actions/cache) and provides a huge improvement in build times.  Caching has been tested on all of the standard GitHub Actions platforms: Linux, MacOS, and Windows.  If you need to reset the cache for some reason, you can force this by changing the `cache-suffix` input value, which defaults to `"000"`.

## Usage

To use the action, add a stanza like this to your GitHub Actions workflow:

```yaml
- name: Setup Poetry
  uses: pronovic/setup-poetry@v2
  with:
    version: "1.8.0"
    plugins: "poetry-dynamic-versioning==1.2.0"
    cache-venv: "true"
    cache-poetry: "true"
```

The `poetry` command will be available on the system `$PATH`, and you can also reference the other environment variables discussed below.

## Configuration

The action accepts a small set of input parameters.

|Input|Required?|Default|Description|
|-----|---------|-------|-----------|
|`version`|Yes||The version of Poetry to install; supports v1.8.0 or newer.|
|`plugins`|No|_empty_|A comma-separated list of [Poetry plugins](https://python-poetry.org/docs/master/plugins/#using-plugins) to install; each comma-separated value must be valid input for `pipx inject poetry`|
|`cache-venv`|No|`"false"`|Whether to cache the project virtual environment under `.venv`; a string `"true"` or `"false"`|
|`cache-poetry`|No|`"false"`|Whether to cache the Poetry runtime & cache directories under `.poetry`; a string `"true"` or `"false"`|
|`cache-suffix`|No|`"000"`|Suffix to use for the cache keys, which can be used to reset the caches if necessary|
|`max-workers`|No|_unset_|The maximum number of Poetry workers, if the default of 4x cores is too large for your GHA runners; ignored if unset|
|`disable-keyring`|No|`"true"`|Whether to globally disable the Python keyring via Poetry configuration; a string `"true"` or `"false"`|

## Environment

The action exports a set of environment variables to the GitHub Actions environment.

|Variable|Description|
|--------|-----------|
|`PYTHON_VERSION`|The full version of the Python interpreter on the path as `python`, like `3.10.7`|
|`POETRY_VERSION`|The version of Poetry that was installed, like `1.8.0`|
|`POETRY_CONFIG_DIR`|Path to the Poetry configuration directory, within the GitHub Actions workspace|
|`POETRY_HOME`|Path to the Poetry runtime install directory, within the GitHub Actions workspace|
|`POETRY_CACHE`|Path to the Poetry cache directory, within the GitHub Actions workspace|
