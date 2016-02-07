class Castor < Formula
  desc "Very simple command line web crawler"
  homepage "https://github.com/muniere/castor"
  url "https://github.com/muniere/castor/archive/v0.1.0.tar.gz"
  sha256 "8d360a48cabbcbe7449e3685c66ccc991b39516e4d768a087e4598d5b07c8c26"
  head "https://github.com/muniere/castor.git"

  depends_on "crystal-lang"

  def install
    system "crystal", "build", "--verbose", "--release", "src/app/castor.cr"

    bin.install "castor"
    zsh_completion.install "src/zsh-completions/_castor"
  end

  test do
    system "castor", "help"
  end
end
