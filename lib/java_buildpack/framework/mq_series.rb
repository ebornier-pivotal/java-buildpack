require 'java_buildpack/framework'

module JavaBuildpack::Framework

  # Adds a system property containing a timestamp of when the application was staged.
  class MQSeries < JavaBuildpack::Component::BaseComponent
    def initialize(context)
      super(context)
    end

    def detect
      'staging-timestamp'
    end

    def compile
      system("pwd");
      puts "step 1";
      system("ls " + ARGV[0]);
        puts "step 2";
      system("ls " + ARGV[1]);
        puts "step 3";
      system("ls " + ARGV[2]);
      system ("tar xvf ../../../resources/opt_mqm_lib64.tar -C /home/vcap/tmp");
      system ("tar xvf ../../../resources/opt_mqm_java_lib64.tar -C /home/vcap/tmp");
    end

    def release
      @droplet.java_opts.add_system_property('staging.timestamp', "'#{Time.now}'")
    end
  end
end
