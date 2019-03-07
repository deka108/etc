# Ruby

## Version Management

Preferred Tool: [rbenv](https://github.com/rbenv/rbenv)

How to Install: `brew install rbenv ruby-build `

How to Setup: follow [this guideline](https://github.com/rbenv/rbenv#installing-ruby-versions)

## Installing Ruby

```bash
rbenv install $(rbenv install -l | grep -v - | tail -1) # install the latest ruby version
```

## Dependency Management

Preferred Tool: [ruby gems](https://rubygems.org/)