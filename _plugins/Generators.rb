module Jekyll
  class LifeListGenerator < Generator
    def generate(site)
      lifelist = Array.new
      site.posts.each do | post |
        if post.data['birds']
          post.data['lifelist'] = []
          for bird in post.data['birds']
            # Should maybe revamp this storing a hash of arrays with additional data? First date, er, what else?
            unless lifelist.include? bird.capitalize # Using capitalize here to prevent dupes.
              post.data['lifelist'].push(bird)  # add to lifelist array on post
              lifelist.push(bird.capitalize)  # add to lifelist for page
              # Create page for bird unless already on lifelist
              site.pages << BirdPage.new(site, "/", "birds/#{ bird.downcase.gsub(" ", "-") }", bird)
            end
            # push post info to bird's page 
          end
        end
      end

      lifelist.sort!
      site.pages <<  LifeListPage.new(site, site.source, "lifelist", "index.html", lifelist)
    end
  end

  class LifeListPage < Page
    def initialize(site, base, dir, name, lifelist)
      super(site, base, dir, name)
      self.data['lifelist'] = lifelist 
    end
  end

  class BirdPage < Page
    def initialize(site, base, dir, bird)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'birdpage.html')
      self.data['bird'] = bird
      #category_title_prefix = site.config['category_title_prefix'] || 'Bird: '
      #self.data['title'] = "#{category_title_prefix}#{bird}"
    end
  end
end

