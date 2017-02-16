#
# Copyright 2012-2015 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "net-snmp"
default_version "5.7.3"

version "5.7.3" do
  source md5: "d4a3459e1577d0efa8d96ca70a885e53"
end

dependency 'perl'

source url: "https://downloads.sourceforge.net/project/net-snmp/net-snmp/#{version}/net-snmp-#{version}.tar.gz",
       extract: :seven_zip

relative_path "net-snmp-#{version}"

configure_env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}",
}

build do
  ship_license "https://gist.githubusercontent.com/truthbk/219266c31f7d664c749dba525eb8a7b0/raw/82539d51d5b1e545e1ceb241b25f476956b636f9/net-snmp.license"
  command "./configure --with-defaults --enable-shared --enable-static", :env => configure_env
  command "make -j #{workers}"
  command "make install"
end
