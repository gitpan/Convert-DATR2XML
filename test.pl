#! perl


# $DATR2XML = new DATR2XML ('D:\DATR2XML\Archive\all.dtr', "on");
# viewAll $DATR2XML;
# $DATR2XML -> save ('D:\DATR2XML\Archive\all.xml');



# $DATR2XML = new DATR2XML ('D:\DATR2XML\XSLT\eg_opening.dtr', "verbose");
# print "\n\n";
# viewOpening $DATR2XML;
# print "\n\n";
# printOpening $DATR2XML;

use DATR2XML;

DATR2XML::set_dtd('d:/DATR/DTD/DATR1.0.dtd');
DATR2XML::set_stylesheet('D:/DATR/XSLT/prolog.xsl');

$datr = new DATR2XML("D:/DATR/Archive/eg_all.dtr","verbose");
$datr -> print_comments(1);
$datr -> printAll("D:/DATR/Archive/eg_all.xml");

# DATR2XML::convert("D:/DATR/Archive/gerald_prolog.dtr","verbose");


=head

use Benchmark;
timethis(10,
	sub { DATR2XML::convert('D:\DATR\Archive') }
);


timethis(1000,
	sub { null('D:\DATR\Archive') }
);

sub null{
	opendir DIR, 'D:\DATR\Archive';
	foreach (grep /\.dtr$/, readdir DIR){
		open IN,$_;
		@_ = <IN>;
		close IN;
	}
	close DIR;
}
=cut
