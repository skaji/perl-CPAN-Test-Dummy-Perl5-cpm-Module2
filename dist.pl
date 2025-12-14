my @prereq = (
    [ Prereqs => 'ConfigureRequires' ] => [
        'CPAN::Test::Dummy::Perl5::cpm::Builder' => '2',
        'perl' => '5.008001',
    ],
    [ Prereqs => 'RuntimeRequires' ] => [
        'perl' => '5.008001',
    ],
);

my @plugin = (
    'ExecDir' => [ dir => 'script' ],
    'Git::GatherDir' => [ exclude_filename => 'META.json', exclude_filename => 'Build.PL' ],
    'CopyFilesFromBuild' => [ copy => 'META.json', copy => 'Build.PL' ],
    'VersionFromMainModule' => [],
    'ReversionOnRelease' => [ prompt => 1 ],
    'NextRelease' => [ format => '%v  %{yyyy-MM-dd HH:mm:ss VVV}d%{ (TRIAL RELEASE)}T' ],
    'Git::Check' => [ allow_dirty => 'Changes', allow_dirty => 'META.json' ],
    'GithubMeta' => [ issues => 1 ],
    'ReadmeAnyFromPod' => [ type => 'markdown', filename => 'README.md', location => 'root' ],
    'MetaProvides::Package' => [ inherit_version => 0, inherit_missing => 0 ],
    'PruneFiles' => [ filename => 'dist.pl', filename => 'README.md', match => '^(xt|author|maint|example|eg)/' ],
    'GenerateFile' => [ filename => 'Build.PL', content => "use CPAN::Test::Dummy::Perl5::cpm::Builder;\nCPAN::Test::Dummy::Perl5::cpm::Builder::Build_PL();" ],
    'MetaJSON' => [],
    'Git::Contributors' => [],

    'CheckChangesHasContent' => [],
    'ConfirmRelease' => [],
    'UploadToCPAN' => [],
    'CopyFilesFromRelease' => [ match => '\.pm$' ],
    'Git::Commit' => [ commit_msg => '%v', allow_dirty => 'Changes', allow_dirty => 'META.json', allow_dirty_match => '\.pm$' ],
    'Git::Tag' => [ tag_format => '%v', tag_message => '%v' ],
    'Git::Push' => [],
);

my @config = (
    name => 'CPAN-Test-Dummy-Perl5-cpm-Module2',
    [ @prereq, @plugin ],
);
