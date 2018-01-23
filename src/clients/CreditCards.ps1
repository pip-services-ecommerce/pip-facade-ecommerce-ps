########################################################
##
## CreditCards.ps1
## Client facade to ecommerce Pip.Services
## CreditCards commands
##
#######################################################


function Get-PipCreditCards
{
<#
.SYNOPSIS

Gets page with credit cards by specified criteria

.DESCRIPTION

Gets a page with credit cards that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER Method

An operation method (default: 'Get')

.PARAMETER Uri

An operation uri (default: /api/1.0/credit_cards)

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-PipCreditCards -Filter @{ customer_id="1" } -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Method = "Get",
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Uri = "/api/1.0/credit_cards",
        [Parameter(Mandatory=$false, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{},
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        $route = $Uri

        $params = $Filter +
        @{ 
            skip = $Skip;
            take = $Take
            total = $Total
        }

        $result = Invoke-PipFacade -Connection $Connection -Method $Method -Route $route -Params $params

        Write-Output $result.Data
    }
    end {}
}


function Get-PipCreditCard
{
<#
.SYNOPSIS

Gets credit card by id

.DESCRIPTION

Gets credit card by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Method

An operation method (default: 'Get')

.PARAMETER Uri

An operation uri (default: /api/1.0/credit_cards/{0})

.PARAMETER Id

A credit card id

.EXAMPLE

Get-PipCreditCard -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Method = "Get",
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Uri = "/api/1.0/credit_cards/{0}",
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = $Uri -f $Id

        $result = Invoke-PipFacade -Connection $Connection -Method $Method -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-PipCreditCard
{
<#
.SYNOPSIS

Creates a new credit card

.DESCRIPTION

Creates a new credit card

.PARAMETER Connection

A connection object

.PARAMETER Method

An operation method (default: 'Post')

.PARAMETER Uri

An operation uri (default: /api/1.0/credit_cards)

.PARAMETER Card

A credit card with the following structure:
    id: string
    customer_id: string
    name?: string
    saved?: boolean
    default?: boolean
    create_time?: Date
    update_time?: Date
    type?: string - visa, mastercard, amex, discover, maestro
    number?: string
    expire_month?: number
    expire_year?: number
    first_name?: string
    last_name?: string
    billing_address?: AddressV1
        line1: string
        line2?: string
        city: string
        zip?: string
        postal_code?: string
        country_code: string - ISO 3166-1
    state?: string - ok, expired
    cvc?: string

.EXAMPLE

New-PipCreditCard -Card @{ customer_id="1"; "state"="ok"; type="visa", number="1234567893481283"; expire_month=1; expire_year=2020 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Method = "Post",
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Uri = "/api/1.0/credit_cards",
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Card
    )
    begin {}
    process 
    {
        $route = $Uri

        $result = Invoke-PipFacade -Connection $Connection -Method $Method -Route $route -Request $Card
        
        Write-Output $result
    }
    end {}
}


function Update-PipCreditCard
{
<#
.SYNOPSIS

Creates a new credit card

.DESCRIPTION

Creates a new credit card

.PARAMETER Connection

A connection object

.PARAMETER Method

An operation method (default: 'Put')

.PARAMETER Uri

An operation uri (default: /api/1.0/credit_cards/{0})

.PARAMETER Card

A credit card with the following structure:
    id: string
    customer_id: string
    name?: string
    saved?: boolean
    default?: boolean
    create_time?: Date
    update_time?: Date
    type?: string - visa, mastercard, amex, discover, maestro
    number?: string
    expire_month?: number
    expire_year?: number
    first_name?: string
    last_name?: string
    billing_address?: AddressV1
        line1: string
        line2?: string
        city: string
        zip?: string
        postal_code?: string
        country_code: string - ISO 3166-1
    state?: string - ok, expired
    cvc?: string

.EXAMPLE

Update-PipCreditCard -Card @{ customer_id="1"; "state"="ok"; type="visa", number="1234567893481283"; expire_month=1; expire_year=2020 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Method = "Put",
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Uri = "/api/1.0/credit_cards/{0}",
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Card
    )
    begin {}
    process 
    {
        $route = $Uri -f $Card.id

        $result = Invoke-PipFacade -Connection $Connection -Method $Method -Route $route -Request $Card
        
        Write-Output $result
    }
    end {}
}


function Remove-PipCreditCard
{
<#
.SYNOPSIS

Removes credit card by id

.DESCRIPTION

Removes credit card by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Method

An operation method (default: 'Delete')

.PARAMETER Uri

An operation uri (default: /api/1.0/credit_cards/{0})

.PARAMETER Id

A credit card id

.EXAMPLE

Remove-PipCreditCard -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Method = "Delete",
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Uri = "/api/1.0/credit_cards/{0}",
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = $Uri -f $Id

        $result = Invoke-PipFacade -Connection $Connection -Method $Method -Route $route
        
        Write-Output $result
    }
    end {}
}