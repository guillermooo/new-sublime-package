param([string]$ProjectName = $(throw ("project name required")))


$script:projectRoot = split-path $MyInvocation.MyCommand.Path -parent


function ExpandKeywords {
	$content = get-content -path (join-path $script:projectRoot 'Unnamed.sublime-project') 
	$content = $content -replace "Unnamed",$ProjectName
	$content = $content -replace "unnamed",$ProjectName.ToLower()
	$content | out-file "Unnamed.sublime-project" -encoding "ascii" -force

	$content = get-content -path (join-path $script:projectRoot 'test_harness.py') 
	$content = $content -replace "Unnamed",$ProjectName
	$content = $content -replace "unnamed",$ProjectName.ToLower()
	$content | out-file "test_harness.py" -encoding "ascii" -force

	$content = get-content -path (join-path $script:projectRoot 'manifest.json') 
	$content = $content -replace "Unnamed",$ProjectName
	$content = $content -replace "unnamed",$ProjectName.ToLower()
	$content | out-file "manifest.json" -encoding "ascii" -force

	$content = get-content -path (join-path $script:projectRoot 'Default.sublime-commands') 
	$content = $content -replace "Unnamed",$ProjectName
	$content = $content -replace "unnamed",$ProjectName.ToLower()
	$content | out-file "Default.sublime-commands" -encoding "ascii" -force
}


function RenameFiles {
	rename-item "Unnamed.sublime-project" "$ProjectName.sublime-project"
}


function RemoveFiles {
	set-location $script:projectRoot 
	remove-item '.hg' -recurse -force -erroraction silentlyContinue
	remove-item 'Init.ps1'
	remove-item 'init.sh'
}


ExpandKeywords
RenameFiles
RemoveFiles
