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
      system ("mkdir /home/vcap/app/");
      system ("tar xvf /tmp/buildpacks/java-buildpack/resources/opt_mqm_lib64.tar -C /home/vcap/app/");
      system ("tar xvf /tmp/buildpacks/java-buildpack/resources/opt_mqm_java_lib64.tar -C /home/vcap/app/");
      system ("ls /tmp/buildpacks/java-buildpack/resources/lib/opt/mqm/lib64");
    end

    def release
      @droplet.java_opts.add_system_property('staging.timestamp', "'#{Time.now}'")
    end
  end
end
