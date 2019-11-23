class Foordinate < Formula
  desc "Utility commands to arrange files"
  homepage "https://github.com/muniere/foordinate"
  url "https://github.com/muniere/foordinate/archive/v0.3.0.tar.gz"
  sha256 "eff6135016472fdf41c1b5429bef7d3a0d3a4906d7a0126d17807e5fb6a20e64"
  head "https://github.com/muniere/foordinate.git"

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
