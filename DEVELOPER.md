# Developer Notes

This project is in active use in all of my own Python repositories under [github.com/pronovic](https://github.com/pronovic?repositories).  For a simple example of use, see the [apologies](https://github.com/pronovic/apologies) repository.

As of this writing, I don't release very often, because the action meets my needs and doesn't usually require adjustment.  As a result, releasing is a totally manual process:

```
$ git checkout main && git pull
$ git tag -a -m "Release v2.0.0" v2.0.0
$ git tag -f -a -m "Release v2.0.0" v2
$ git push -f --tags
```

Once that's done, find the [new tag](https://github.com/pronovic/setup-poetry/tags) and create a GitHub release from it.  

