class Farrange < Formula
  desc "Utility commands to arrange files"
  homepage "https://github.com/muniere/farrange"
  url "https://github.com/muniere/farrange/archive/v0.1.0.tar.gz"
  sha256 "d22d1dfd251e95aa1422e6ac57420c487e36ed5b7bde5795d4cb070f35388175"
  head "https://github.com/muniere/farrange.git"

  depends_on "crystal-lang"

  def apps
    ["count", "numberize", "randomize"]
  end

  def install
    apps.each do |app|
      system "crystal", "build", "--verbose", "--release", "src/app/#{app}.cr"
    end

    bin.install apps
  end

  test do
    apps.each do |app|
      system app, "--help"
    end
  end
end
