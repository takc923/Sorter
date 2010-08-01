#!perl

{ package Sorter;
  sub new{
    my $class = shift;
    my $self = { Suuretsu => undef};
    bless $self,$class;
  }
  sub set_values{
    my $self = shift;
    $self->{Suuretsu} = \@_;
  }
  sub get_values{
    my $self = shift;
    @{$self->{Suuretsu}};
  }
  sub sort{
    my $self = shift;
    @suuretsu = @{$self->{Suuretsu}};
    my $left = 0;
    my $right = @suuretsu-1;
    sort_body($left,$right);
    $self->{Suuretsu} = \@suuretsu;
  }
  sub sort_body{
    my $left = shift;
    my $right = shift;
    #—v‘f”1‚È‚ç
    if ($right==$left){
      return;
    }
    my $i=$left;
    my $j=$right;
    my $jiku = $suuretsu[$left];
    while($i<$j){
      while($suuretsu[$i] < $jiku and $i != $right){$i++}
      while($suuretsu[$j] > $jiku and $j != $left){$j--}
      if($i > $j){ last; }
      elsif($i==$j and $i==$left ){ $i++;last; }
      elsif($i==$j and $i==$right){ $j--;last; }
      else{
        @suuretsu[$i,$j] = @suuretsu[$j,$i];
        $i++;$j--;
      }
    }
    sort_body($left,$j);
    sort_body($i,$right);
  }
}

$sorter = Sorter->new;
my @input = (5,4,3,2,1);
print "input is @input.\n";
$sorter->set_values(@input);
$sorter->sort;
my @result = $sorter->get_values;
print "result is @result.\n";
print "done\n";

