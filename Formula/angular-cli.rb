require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-7.3.0.tgz"
  sha256 "a8878e59e5162267b5d5a9dd2c0c024b274c2781e75bd7766f6fa5814b7310f7"

  bottle do
    cellar :any_skip_relocation
    sha256 "3552622b25f4141f5ae0bde26c76e19f5daabf538c7cde64916ac85c074f268d" => :mojave
    sha256 "7dfd16495360feb34280fdc233e881c67fb05cb26ffc04092ba821d7a532ac1e" => :high_sierra
    sha256 "b57b030ab0da3cc446390ae8bcc0102ae87c3fd5ee4379037675d528b75f7f7f" => :sierra
    sha256 "4a50a8e852980c858bbf5a77d71472b09ecdf6629eb0664784fa4da0312d46cc" => :x86_64_linux
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
