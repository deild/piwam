# Piwam

[![Build Status](https://travis-ci.org/deild/piwam.svg?branch=master)](https://travis-ci.org/deild/piwam)
[![Code Climate](https://codeclimate.com/github/deild/piwam/badges/gpa.svg)](https://codeclimate.com/github/deild/piwam)
[![Coverage Status](https://coveralls.io/repos/github/deild/piwam/badge.svg)](https://coveralls.io/github/deild/piwam)

Piwam Is a Wonderful Association Manager.


### Qu'est-ce que c'est ?

Cette application est un portage du projet [Piwam](https://code.google.com/p/piwam), qui est un
excellent gestionnaire d'association dont le développement a malheureusement été abandonné par
son créateur. L'application a donc été entièrement ré-écrite en [Ruby on Rails](http://rubyonrails.org).

![Screenshot de l'application](http://piwam.com/images/screenshot.png)

### Que puis-je gérer avec Piwam ?

Piwam vous permet de gérer les activités d'une association ainsi que d'éditer divers rapports comptables :

- membres
- cotisations
- recettes / dépenses
- activités


### Installation

```
bundle install
rake db:setup
rails s
```

Requiert Ruby 2.2.0 ou supérieur et PostgreSQL.
