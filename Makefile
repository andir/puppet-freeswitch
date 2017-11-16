
all: syntax lint_fix

lint: bundle
	bundle exec rake lint
lint_fix: bundle
	bundle exec rake lint_fix

syntax: bundle
	bundle exec rake syntax

bundle: Gemfile
	bundle install --path vendor/bundle

test: bundle
	bundle exec rake spec
