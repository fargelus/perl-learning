use 5.008009;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'My::Libm',
    VERSION_FROM      => 'lib/My/Libm.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {'XSLoader'    =>  0, }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/My/Libm.pm', # retrieve abstract from module
    AUTHOR            => 'dima <dima@localdomain>',
    #LICENSE           => 'perl',
    #Value must be from legacy list of licenses here
    #https://metacpan.org/pod/Module::Build::API
    LIBS              => ['-lm'], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
	# Insert -I. if you add *.h files later:
    INC               => '', # e.g., '-I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
