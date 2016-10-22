class Fileutils < Formula
  desc "Utility commands to arrange files"
  homepage "https://github.com/muniere/fileutils"
  url "https://github.com/muniere/fileutils/archive/v0.2.0.tar.gz"
  sha256 "e1bccbab6824388a7bde1c428aef8db7f2977d003dcd782afc211a908bbf48a4"
  head "https://github.com/muniere/fileutils.git"

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
