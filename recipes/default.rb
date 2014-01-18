#
# Cookbook Name:: laravel
# Recipe:: default
#
# Copyright 2014, Michael Beattie
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

missing_attrs = %w[
	project_name
  project_root
].select { |attr| node['laravel'][attr].nil? }.map { |attr| %Q{node['laravel']['#{attr}']} }

unless missing_attrs.empty?
  Chef::Application.fatal! "You must set #{missing_attrs.join(', ')}." \
  " For more information, see https://github.com/BeattieM/laravel#attributes"
end

include_recipe "php"

unless File.exists?("#{node['php']['ext_conf_dir']}/mcrypt.ini")
	include_recipe "php-mcrypt"
end

include_recipe "mysql"
include_recipe "apache2"
include_recipe "composer"
include_recipe "laravel::laravel"