<html>
<head>
<style type="text/css">
#giraviItemTbl tbody tr td {
	padding: .2rem;
	vertical-align: middle;
}
</style>
</head>
<body>
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h4 mb-0 text-gray-800">Giravi Master</h1>
		<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50"></i> Generate Report
		</a>
	</div>
	<div class="card shadow mb-4">
		<!-- <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between"></div> -->
		<div class="card-body">
			<form id="giraviMasterForm">
				<h5 class="h5 mb-0 text-gray-800">Giravi Details</h5>
				<hr>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="loanAmt">Loan/Principle Amount</label>
							<input type="text" class="form-control form-control-sm" placeholder="Enter Loan/Principle Amount" id="loanAmt" name="loanAmt">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="loanStartDate">Loan Start Date</label>
							<input type="text" class="form-control form-control-sm" placeholder="Select Loan Start Date" id="loanStartDate" name="loanStartDate">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="loanDuration">Loan Duration Type</label>
							<select class="form-control form-control-sm" id="loanDuration" name="loanDuration">
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="rateOfIn">Rate Of Interest</label>
							<select class="form-control form-control-sm" id="rateOfIn" name="rateOfIn">
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="rateOfIn" class="hide">Customer</label>
							<select class="form-control form-control-sm" id="customerSelect" name="customerSelect">
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="phone">Phone Number</label>
							<input type="tel" class="form-control form-control-sm" id="phone" name="phone" placeholder="phone">
						</div>
					</div>
				</div>
				<hr>
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h5 class="h5 mb-0 text-gray-800">Giravi Items</h5>
					<button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="addGiraviItemRow()" name="">
						<i class="fas fa-plus fa-sm text-white-50"></i> Add Giravi Item
					</button>
				</div>
				<table class="table table-lg table-bordered" id="giraviItemTbl">
					<thead>
						<tr>
							<th>#</th>
							<th>Item</th>
							<th>Quantity</th>
							<th>Grass Weight</th>
							<th>Net Weight</th>
							<th>Valuation</th>
							<th>Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr class="notr">
							<th colspan="8" class="center">No Item Added</th>
						</tr>
					</tbody>
				</table>
				<div class="btn-group float-right">
					<button type="button" class="btn btn-sm btn-secondary shadow-sm m-r-10" onclick="clearForm()">
						<i class="fas fa-times fa-sm text-white-50"></i> Clear
					</button>
					<button type="button" class=" btn btn-sm btn-primary shadow-sm" onclick="saveGiravi()">
						<i class="fas fa-save fa-sm text-white-50"></i> Save Giravi
					</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var partyAccountList = JSON.parse(JSON.stringify(${partyAccountList}));
		console.log('partyAccountList parsed::',partyAccountList);
		var metalSelection = '<option value="G">Gold</option><option value="S">Silver</option><option value="T">Titanium</option>';
		var weightSelection = '<option value="gm">Gram</option><option value="mgm">MilliGram</option><option value="kg">KilloGram</option>';
		var giraviFormValidation = $('#giraviMasterForm').validate({});

		$('#loanAmt').rules("add", {required: true});
		$('#loanStartDate').rules("add", {required: true});
		$('#loanDuration').rules("add", {required: true});
		$('#rateOfIn').rules("add", {required: true});
		$('#customerSelect').rules("add", {required: true});
		var customerSelection = '';
		$.each(partyAccountList,function(i,ob){
			$('#customerSelect').append('<option value="'+ob.id+'" paddr1="'+ob.partyAddr1+'" paddr2="'+ob.partyAddr2+'" pcity="'+ob.partyCity+'" pmob="'+ob.partyMobile1+'">'+ob.partyName+'</option>');
			//customerSelection = customerSelection + '<option value="'+{ob.id}+'" paddr1="'+{ob.partyAddr1}+'" paddr2="'+{ob.partyAddr2}+'" pcity="'+{ob.partyCity}+'" pmob="'+{ob.partyMobile1}+'">'+{ob.partyName}+'</option>';
		});

		$('#customerSelect').select2({
			placeholder : "Select customer",
			allowClear : true,
			width : "100%"
		}).on('change',function(){
			console.log('vll',$(this).val())
			if($(this).val()!=null){
				$('#phone').val($(this).find('option:selected').attr('pmob'));
			}else{
				$('#phone').val('');
			}
		}).val(null).trigger('change');
		
		function addGiraviItemRow(){
			$('.notr').remove();
			var i = $('#giraviItemTbl tbody tr').length + 1;
			var tr = '<tr>';
			tr = tr + '<td class="srno">'+i+'</td>';
			tr = tr + '<td class=""><div class="d-sm-flex"><select class="form-control form-control-sm itm-metal" style="width:100px; name="itm-metal-'+i+'">'+metalSelection+'</select><input type="text" class="form-control form-control-sm itm-name" name="itm-name-'+i+'"></div></td>';
			tr = tr + '<td><input type="text" class="form-control form-control-sm itm-qty" name="itm-qty-'+i+'"></td>';
			tr = tr + '<td class=""><div class="d-sm-flex"><input type="text" class="form-control form-control-sm itm-g-weight" name="itm-g-weight-'+i+'"><select class="form-control form-control-sm itm-g-uom" style="width:100px;" name="itm-g-uom-'+i+'">'+weightSelection+'</select></div></td>';
			tr = tr + '<td class=""><div class="d-sm-flex"><input type="text" class="form-control form-control-sm itm-n-weight" name="itm-n-weight-'+i+'"><select class="form-control form-control-sm itm-n-uom" style="width:100px;" name="itm-n-uom-'+i+'">'+weightSelection+'</select></div></td>';
			tr = tr + '<td><input type="text" class="form-control form-control-sm itm-val" name="itm-val-'+i+'"></td>';
			tr = tr + '<td></td>';
			tr = tr + '<td class="center"><button type="button" class="btn btn-sm btn-danger" onclick="removeGiraviItemRow(this)"><i class="fa fa-trash"></i></button></td>';
			tr = tr + '</tr>';
			$('#giraviItemTbl tbody').append(tr);

			$('.itm-metal:last').rules("add", {required: true});
			$('.itm-name:last').rules("add", {required: true});
			$('.itm-qty:last').rules("add", {required: true});
			$('.itm-g-weight:last').rules("add", {required: true});
			$('.itm-n-weight:last').rules("add", {required: true});
			$('.itm-g-uom:last').rules("add", {required: true});
			$('.itm-n-uom:last').rules("add", {required: true});
		}

		function removeGiraviItemRow(el){
			$(el).closest('tr').remove();
			if($('#giraviItemTbl tbody').find('tr').length<=0){
				$('#giraviItemTbl tbody').append('<tr class="notr"><th colspan="'+($('#giraviItemTbl thead').find('th').length)+'" class="center">No Item Added</th></tr>');
			}else{
				$('#giraviItemTbl tbody').find('tr').each(function(i,tr){
					$(tr).find('.srno').text(i+1);
				});
			}
		}

		function clearForm(){
			
			$('.itm-metal').val('');
			$('.itm-name').val('');
			$('.itm-qty').val('');
			$('.itm-g-weight').val('');
			$('.itm-n-weight').val('');
			$('.itm-g-uom').val('');
			$('.itm-n-uom').val('');

			$('#loanAmt').val('');
			$('#loanStartDate').val('');
			$('#loanDuration').val('');
			$('#rateOfIn').val('');
			$('#customerSelect').val('');

			giraviFormValidation.resetForm();
		}

		
		function saveGiravi() {
			if (!giraviFormValidation.form()) {
				giraviFormValidation.showErrors();
			} else {
				var lineArr = [];
				$('#giraviItemTbl>tbody').find('tr').each(function(i,tr){
					var lineObj = {};
					lineObj.itmMetal = $(tr).find('.itm-metal').val();
					lineObj.itmName = $(tr).find('.itm-name').val();
					lineObj.itmQty = $(tr).find('.itm-qty').val();
					lineObj.itmGrossWeight = $(tr).find('.itm-g-weight').val();
					lineObj.itmGrossUom = $(tr).find('.itm-g-uom').val();
					lineObj.itmNetWeight = $(tr).find('.itm-n-weight').val();
					lineObj.itmNetUom = $(tr).find('.itm-n-uom').val();
					lineObj.itmVal = $(tr).find('.itm-val').val();
					lineArr.push(lineObj);
				});

				var jsonData = {
					"head" : {
						"loanAmt" : $('#loanAmt').val(),
						"loanStartDate" : $('#loanStartDate').val(),
						"loanDuration" : $('#loanDuration').val(),
						"rateOfIn" : $('#rateOfIn').val(),
						"customer" : $('#customerSelect').val(),
						"loanAmt" : $('#loanAmt').val(),
						"loanAmt" : $('#loanAmt').val(),
					},
					"line" : lineArr
				};
				$.ajax({
					url : "",
					type : "POST",
					data : {
						"jsonData" : JSON.stringify(jsonData)
					},
					success : function(resp) {

					}
				});
			}
		}
	</script>
</body>
</html>