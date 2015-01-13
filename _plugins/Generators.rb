module Jekyll
  class LifeListGenerator < Generator
    def generate(site)
      lifelist = Array.new
      site.posts.each do | post |
        if post.data['birds']
          for bird in post.data['birds']
            # sanitise case here
            lifelist.push(bird.downcase) unless lifelist.include? bird.downcase
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

