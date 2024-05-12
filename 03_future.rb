# This file will not run properly, it is theoretical

# AST Wildcard Searching

Person.where(favorite_language: _)
Person.where(favorite_language: _)

Person.where(favorite_language: _)
  .group(_)
  .count

Person
  .joins(_)
  .where(job: { language: _ })
  .where.not(favorite_language: _)
Person
  .joins(_)
  .where(job: { language: _ })
  .where.not(favorite_language: _)

# Did you Mean?

# Public API
module MyAPI
  def self.favorite_language_counts
    Person.group(:favorite_language).count
  end
end

# Elsewhere

# CodeLens hint: Did you mean MyAPI.favorite_language_counts?
Person.group(:favorite_language).count

# Gem Upgrade

# Run several Refactor rules to try and automate
# upgrade as much as possible.
bundle exec GEM_NAME upgrade

# A to B

class ShorthandRewrite < Refactor::Rule
  from "$receiver { |$arg| $arg.$method }"
  to "$receiver(&:$method)"
end
