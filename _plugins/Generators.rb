module Jekyll
  class LifeListGenerator < Generator
    def generate(site)
      lifelist = Array.new
      site.posts.each do | post |
        if post.data['birds']
          post.data['lifelist'] = []
          for bird in post.data['birds']
            # Using capitalize here to prevent dupes.
            # Should maybe revamp this storing a hash of arrays with additional data?
            post.data['lifelist'].push(bird) unless lifelist.include? bird.capitalize # add to lifelist array on post
            lifelist.push(bird.capitalize) unless lifelist.include? bird.capitalize # add to lifelist for page.
          end
        end
      end

      site.pages <<  LifeListPage.new(site, site.source, "lifelist", "index.html", lifelist)
    end
  end

  class LifeListPage < Page
    def initialize(site, base, dir, name, lifelist)
      super(site, base, dir, name)
      self.data['lifelist'] = lifelist 
    end
  end
end

