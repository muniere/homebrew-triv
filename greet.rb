class Greet < Formula
  desc "Print messages"
  homepage "https://github.com/muniere/greet"
  url "https://github.com/muniere/greet/releases/download/0.0.1/greet.jar"
  sha256 "5fc8d65403281c235a7509fa2244f25cc212af4cd12c657b582c994caecda1b4"

  depends_on :java => "1.7+"

  if build.head?
    depends_on "scala" => :build
    depends_on "sbt" => :build
  end

  def install
    if build.head?
      system "sbt", "assembly"
      libexec.install "target/greet.jar"
    else
      libexec.install "greet.jar"
    end
    bin.write_jar_script libexec/"greet.jar", "greet"
  end

  test do
    system "greet"
  end
end
