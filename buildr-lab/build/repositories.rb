# Specify Maven 2.0 remote repositories here, like this:
repositories.remote << "http://repo1.maven.org/maven2"
repositories.remote << "http://www.ibiblio.org/maven2/"

# Spring repos
%w(release external milestone snapshot).each do |repo|
  repositories.remote << "http://repository.springsource.com/maven/bundles/#{repo}"
end

