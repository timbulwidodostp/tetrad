{smcl}
{* 5/6/14}{...}
{title:Title}

{p2colset 8 18 24 2}{...}
{p2col:{cmd:tetrad_bootstrap}} Bootstrap extension for Confirmatory Tetrad Analysis.{p_end}
{p2colreset}{...}

{marker syn}
{title:Syntax}

{p 8 18 2}
{cmd:tetrad_bootstrap} {varlist} {ifin} {cmd:,} {cmd: icm1}({it:matname}) [ {it:options} ]
{p_end}


{p 4 4 2}
{cmd: icm1}({it:matname}) refers to the name of an implied covariance matrix.  

{synoptset 20 tabbed}{...}
{synoptline} 
{synopthdr}
{synoptline} 

{syntab:Nested Test} 
{synopt:{cmd:icm2}({it:matname})} Name of an implied covariance matrix nested in first implied covariance matrix {p_end} 

{syntab:Replications} 
{synopt:{cmd:reps(#)}} Number of bootstrap replications {p_end} 
{synopt:{cmd:seed}({it:string})} Random number seed {p_end} 

{synoptline} 

{marker des}
{title:Description}

{pstd}
{cmd:tetrad_bootstrap} conducts Confirmatory Tetrad Analysis (CTA) for a given structural equation model with a bootstrapped chi-square test statistic as outlined in Bodner and Johnson (2007) {p_end}



{marker opt}
{title:Options}

{marker Nested}
{dlgtab:Nested Test}

{p 4 4 2}
{cmd:icm2}({it:matname}) may be used to specify a tetrad-nested model implied covariance matrix to obtain a nested CTA.
{p_end}

{marker Replications}
{dlgtab:Replications}

{p 4 8 2}
{cmd:reps(#)} may be specified to request # bootstrap replications. The default is 100 replication.s

{p 4 8 2}
{cmd:seed}({it:string}) may be used to specify a random number seed.


{marker exa}
{dlgtab: Exmamples}

{p 4 8 2}
Below is a basic example of {cmd: tetrad} based on a single factor measurement model with four indicators.

	{com}. use http://www.stata-press.com/data/r14/sem_1fmm
	{txt}(single-factor measurement model)


{p 4 8 2}
Specify structural equation model and store implied covariance matrix.

	{com}. {res}qui sem {txt}(x1 x2 x3 x4 <- X)
	{com}. {res}qui estat {txt}framework, fitted
	{com}. {res}mat {txt}sigma1 = r(Sigma)


{p 4 8 2}
Conduct CTA with 5 replications and list model-implied tetrads.

	{com}. {res}tetrad_bootstrap {txt}x1 x2 x3 x4, icm1(sigma1) reps(500) seed(15498858)


	Confirmatory Tetrad Analysis Results

    	                 bootstrap
	Chi-sq       df      p-value
	------------------------------
	  2.0918      3      0.4480
	------------------------------

{marker aut}
{title:Author}

{p 4 4 2}
Shawn Bauldry, University of Alabama-Birmingham, sbauldry@uab.edu


