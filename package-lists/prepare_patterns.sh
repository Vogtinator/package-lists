cd /home/pattern
export RPM_SOURCE_DIR=$PWD
cd products
rm -rf mydata
cp -a patterns-$3-data mydata
cd mydata
export RPM_BUILD_ROOT=/tmp/patterns.$1
export EXPLICIT_UNAME=$2
for i in data/*; do sh $RPM_SOURCE_DIR/preprocess $i; done | perl $RPM_SOURCE_DIR/create-suggests | \
   uniq > data/REST-DVD-SUGGESTS
for i in gnome kde3 kde4; do
  sh $RPM_SOURCE_DIR/preprocess toinstall/rest_cd_$i/requires > t && \
    mv t toinstall/rest_cd_$i/requires
done
for i in `cd toinstall && ls -1d *`; do 
   mkdir -p utf8_summary/$i/
   echo "=Sum: Nada" >  utf8_summary/$i/default
   mkdir -p utf8_description/$i/ 
   ( echo "+Des:"; echo "nada" ; echo "-Des:" ) >  utf8_description/$i/default
done
rm -rf $RPM_BUILD_ROOT 
sh -x $RPM_SOURCE_DIR/sort_opensuse_patterns 11.1 1 $1
cd ..
rm -rf mydata

