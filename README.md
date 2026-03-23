# RubyAudit Fork

[![Gem Version](https://badge.fury.io/rb/ruby-audit-fork.svg)](http://badge.fury.io/rb/ruby-audit-fork)

> **⚠️ This is a fork of [ruby_audit](https://github.com/civisanalytics/ruby_audit) with JRuby compatibility fixes**
>
> The original gem is available at: https://rubygems.org/gems/ruby_audit
>
> This fork includes JRuby compatibility fixes that may not yet be merged upstream.
> **All development, bug reports, and contributions should go to the original project:**
> https://github.com/civisanalytics/ruby_audit
>
> This is NOT a maintained fork. It's published for users who need JRuby compatibility.

## About

RubyAudit checks your current version of Ruby and RubyGems against known security vulnerabilities (CVEs), alerting you if you are using an insecure version.
It complements [bundler-audit](https://github.com/rubysec/bundler-audit), providing complete coverage for your Ruby stack.
If you use Bundler, you should use both RubyAudit and bundler-audit.

RubyAudit is based on and leverages bundler-audit, and would not exist without the hard work of the [rubysec](https://github.com/rubysec) team, specifically bundler-audit and [ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db).

"If I have seen further it is by standing on the shoulders of Giants." -- Isaac Newton

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-audit-fork'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-audit-fork

### Why use this fork?

Use this fork if you need JRuby compatibility. The original `ruby_audit` gem is available
at https://rubygems.org/gems/ruby_audit - use that unless you specifically need the JRuby fixes.

This fork includes:
- JRuby compatibility fix (use JRUBY_VERSION when checking jruby engine)

The executable and API are identical to the original.

Because bundler-audit requires bundler, RubyAudit requires bundler as a transitive
dependency.  If you don't intend to run RubyAudit in the production environment, you
may selectively install it in your development and test environments by using
[Bundler groups](https://bundler.io/guides/groups.html).

## Usage

To check your current version of Ruby and RubyGems:

```bash
$ ruby-audit check
```

You can ignore specific advisories by specifying `-i <advisory>`:

```bash
$ ruby-audit check -i CVE-2015-7551
```

By default, RubyAudit will check for updates to the ruby-advisory-db when it runs.
If you are using RubyAudit offline, you can bypass this check by specifying `-n`:

```bash
$ ruby-audit check -n
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
You'll also want to run `git submodule update --init` to populate the ruby-advisory-db
submodule in `/vendor` that is used for testing. Then, run `rake` to run linting and tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The database in `/vendor/ruby-advisory-db` is only used as a fixture for unit tests.
By default, the database used for actual vulnerability checks is stored at `~/.local/share/ruby-advisory-db`.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

**Please contribute to the original project:** https://github.com/civisanalytics/ruby_audit

This fork is not actively maintained. All bug reports, feature requests, and pull requests
should be directed to the upstream repository.

## License

RubyAudit is released under the [GNU General Public License version 3](LICENSE.md).
