#
# Cookbook Name:: simple-web-new
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'simple-web-new::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'downloads the web content tarball' do
      expect(chef_run).to create_cookbook_file('/tmp/webfiles.tar.gz')
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates index.html' do
      expect(chef_run).to render_file('/var/www/index.html')
    end
  end
end
