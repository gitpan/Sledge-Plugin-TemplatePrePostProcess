use ExtUtils::MakeMaker;
WriteMakefile(
        'NAME'         => 'Sledge::Plugin::TemplatePrePostProcess',
        'VERSION_FROM' => 'lib/Sledge/Plugin/TemplatePrePostProcess.pm', # finds $VERSION
        'PREREQ_PM'    => {
                Test::More => 0.32,
        },
);
