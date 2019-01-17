# ![](.readme/patternbot-logo.png) Jekyll Patternbot

*Your pompous and persnickety patterning robot.*

---

There are lots of fantastic tools for creating style guides and pattern libraries—but they all have a lot of embedded knowledge (command line, Gulp, Grunt, PHP, Handlebars, SASS, etc.)

It’s just too much *stuff* for my students. I don’t want them to have to learn the tool, I want them to use a tool and get on with designing.

My aim is not to replace the wonderful tools that exist, but simplify them into a very minimal package that can get the students familiarized with using style guides without having to learn all the extra stuff.

**This is actually my second version of making a pattern library app: the first was a GUI.** But after working with students for a while & teaching & understanding their knowledge sphere, I’ve switched to a Jekyll plugin. It’s better at scaffolding their knowledge into future terms and opens up lots learning opportunities within the Jekyll ecosystem.

---

## Installation & setup

**First make sure you have Ruby, RubyGems & Bundler installed. [☛ See this lesson for help with installing the tools.](https://learn-the-web.algonquindesign.ca/courses/web-dev-4/install-more-developer-tools/)**

After cloning your GitHub repo, press `Open in Terminal` from within GitHub Desktop.

### 1. Add a Gemfile

**Within Terminal type: `bundle init`**—this will create a new file in your folder named `Gemfile`

Edit your `Gemfile` and add these lines to the bottom:

```ruby
gem "jekyll"

group :jekyll_plugins do
  gem "jekyll_patternbot"
end
```

Then pop back over to **Terminal and run this command: `bundle install`**

### 2. Add a Ruby version

In your code editor create a new file named `.ruby-version`

Enter a current Ruby version number into the file, `2.5.3` is a recent version you can use.

```
2.5.3
```

### 3. Configure Jekyll

Finally we need to configure Jekyll to use Patternbot. It’s already using the Patternbot plugins, as defined in our `Gemfile`, but we need to specify the Patternbot theme too.

In your code editor, **create a new file `_config.yml`**

Add this to your Jekyll `_config.yml` file:

```yml
permalink: pretty

theme: jekyll_patternbot
```

*The `permalink: pretty` isn’t necessary—but I always like to have nice permalinks in my websites.*

---

## Hosting Jekyll Patternbot

*Although GitHub supports Jekyll, its list of allowed plugins is very strict—which means Patternbot cannot run on GitHub Pages.*

I suggest using [Netlify](https://www.netlify.com/) as a substitute to GitHub hosting for your projects that use Jekyll Patternbot.
