# Developer Notes

This project is in active use in all of my own Python repositories under [github.com/pronovic](https://github.com/pronovic?repositories).  For a simple example of use, see the [apologies](https://github.com/pronovic/apologies) repository.

Releasing is a manual process:

```
$ git checkout master && git pull
$ git tag -a -m "Release v1.0.1" v1.0.1
$ git tag -f -a -m "Release v1.0.1" v1
$ git push -f --tags
```

As of this writing, I don't release very often, because the action meets my needs and doesn't usually require adjustment.  
