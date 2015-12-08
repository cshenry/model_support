use model_support::model_supportImpl;

use model_support::model_supportServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = model_support::model_supportImpl->new;
    push(@dispatch, 'model_support' => $obj);
}


my $server = model_support::model_supportServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
