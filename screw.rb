class Screw < Formula
  desc "Very simple command line web crawler with Go."
  homepage "https://github.com/muniere/screw"
  url "https://github.com/muniere/screw/archive/v0.1.0.tar.gz"
  sha256 "c09e8a2973c493651114050a491c7d9d606dc99da5e5d4b17f88a843a43d29dc"
  head "https://github.com/muniere/screw.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    srcpath = buildpath/"src/github.com/muniere/screw/"
    srcpath.install buildpath.children

    cd srcpath do
      system "make deps"
      system "make"
      bin.install ".bin/screw"
    end
  end

  test do
    system "screw", "--help"
  end
end
