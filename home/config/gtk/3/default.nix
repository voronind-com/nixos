{ util, ... }:{
	bookmarks = util.trimTabs ''
		file:///storage
		file:///home/voronind/tmp
		sftp://192.168.1.2:22143/storage/hot/docker/cloud/data/data/cakee/files/ home cloud
		sftp://192.168.1.2:22143/ home sftp
		ftp://192.168.1.2/ home ftp
	'';
}