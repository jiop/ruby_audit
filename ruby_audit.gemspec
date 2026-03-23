lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_audit/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-audit-fork'
  spec.version       = RubyAudit::VERSION
  spec.authors       = ['Jeff Cousens, Mike Saelim', 'John Zhang', 'Cristina Muñoz']
  spec.email         = ['opensource@civisanalytics.com']
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.summary       = 'Checks Ruby and RubyGems against known vulnerabilities (Fork with JRuby compatibility).'
  spec.description   = 'RubyAudit checks your current version of Ruby and ' \
                       'RubyGems against known security vulnerabilities ' \
                       '(CVEs), alerting you if you are using an insecure ' \
                       'version. It complements bundler-audit, providing ' \
                       'complete coverage for your Ruby stack. ' \
                       'This is a fork of ruby_audit (https://rubygems.org/gems/ruby_audit) ' \
                       'with JRuby compatibility fixes. Use the original gem unless you need JRuby support. ' \
                       'All development happens upstream at https://github.com/civisanalytics/ruby_audit'
  spec.homepage      = 'https://github.com/jiop/ruby_audit'
  spec.license       = 'GPL-3.0-or-later'

  spec.metadata['source_code_uri']   = 'https://github.com/jiop/ruby_audit'
  spec.metadata['bug_tracker_uri']   = 'https://github.com/jiop/ruby_audit/issues'
  spec.metadata['changelog_uri']     = 'https://github.com/jiop/ruby_audit/blob/main/CHANGELOG.md'
  spec.metadata['original_project']  = 'https://github.com/civisanalytics/ruby_audit'

  spec.required_ruby_version = ['>= 3.1', '< 4.1']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'bundler-audit', '~> 0.9.0'
end
