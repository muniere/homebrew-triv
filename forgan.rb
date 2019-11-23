class Forgan < Formula
  desc "File ORGANize utils written with Go"
  homepage "https://github.com/muniere/forgan"
  url "https://github.com/muniere/forgan/archive/v0.1.0.tar.gz"
  sha256 "d7ef9ebdbf35a379774a0d0e67f8ed15df6076d7451e31a71e8fe95ba5b1e8f5"
  head "https://github.com/muniere/forgan.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def apps
    cmds.map { |x| ".bin/#{x}" }
  end

  def cmds
    ["count", "numberize", "randomize"]
  end

  def install
    ENV["GOPATH"] = buildpath

    srcpath = buildpath/"src/github.com/muniere/forgan/"
    srcpath.install buildpath.children

    cd srcpath do
      system "make deps"
      system "make"
      bin.install apps
    end
  end

  test do
    cmds.each do |cmd|
      system cmd, "--help"
    end
  end
end

