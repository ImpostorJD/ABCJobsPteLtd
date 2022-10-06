<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta charset="ISO-8859-1">
                        <title>ABC Jobs Community Portal</title>
                        <link rel="icon" type="images/png" href="images/UIF logo header.png">
                        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
                        <script type="text/javascript" src="js/bootstrap.js"></script>
                        <link rel="stylesheet" href="css/style.css">
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    </head>

                    <body>
                        <header class="fixed-top">
                            <jsp:include page="components/header.jsp" />
                        </header>
                        <div class='container-fluid' style="margin-top: 15rem; margin-bottom:10rem;">
                            <div class="mx-5">
                                <div class="px-5">
                                    <div class="card shadow">
                                        <div class="card-header bg-transparent border-0 p-5">
                                            <h1 class="card-title">Update Profile</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row gy-5">

                                                <!-- Update images -->
                                                <div class="col-12 card">
                                                    <div class="card-body">
                                                        <form action="/change-image?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
                                                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                            <div class="border rounded w-100 overflow-hidden position-relative" style="height: 25vw;">
                                                                <c:if test="${user.getBannerImagePath() eq null }">
                                                                    <img src="images/banner-imageplaceholder.png" class="w-100 h-100">
                                                                </c:if>
                                                                <c:if test="${ user.getBannerImagePath() ne null}">
                                                                    <img src="bannerPicture/${user.getBannerImagePath()}" class="w-100 h-100">
                                                                </c:if>
                                                                <div class="position-absolute start-50 bottom-50 translate-middle-x" style="height:5vw; width:30vw;">
                                                                    <label for="bannerUpload" class="btn btn-success w-100 h-100" style="font-size:1.667vw;">
						                                                Upload Banner Image
						                                            	<input type ="file" id ="bannerUpload" style ="opacity:0;" name ="bannerPicture" class=" form-control stretched-link w-100 h-100"/>
						                                        	</label>
                                                                </div>
                                                            </div>
                                                            <div id="EditDP" class="p-4 mt-4">
                                                                <div class="d-flex justify-content-center">
                                                                    <div style="height:13vw; width:13vw;" class="border rounded-circle overflow-hidden">
                                                                        <c:if test="${user.getProfileImagePath() eq null }">
                                                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                                        </c:if>
                                                                        <c:if test="${ user.getProfileImagePath() ne null}">
                                                                            <img src="displayPicture/${user.getProfileImagePath()}" class="w-100 h-100">
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex justify-content-center my-3" style="height:5vw">
                                                                    <label for="bannerUpload" class="btn btn-outline-success position-relative w-100 h-100">
					                                                    Upload Profile Picture
					                                                <input type ="file" id ="bannerUpload" style ="opacity:0;" name ="displayPicture" class="stretched-link form-control w-100 h-100" />
					                                                </label>
                                                                </div>
                                                            </div>

                                                            <button type="submit" class="btn btn-success w-100">Update Profile</button>
                                                        </form>
                                                    </div>
                                                </div>

                                                <!-- update primary -->
                                                <div class="col-12 card p-5">
                                                    <div class="card-header bg-transparent border-0">
                                                        <h1 class="h3 form-label text-success">Primary Information</h1>
                                                    </div>
                                                    <div class="card-body">
                                                        <sf:form class="row gy-5" action="/edit-primary-information" method="post" modelAttribute="updateUserInfo">
                                                            <!-- Username -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="EditUN" class="col-form-label col-md-3 col-12">Display Name</label>
                                                                    <div class="col-md-9 col-12">

                                                                        <sf:input type="text" class="form-control" id="EditUN" path="displayName" value="${user.getDisplayName()}" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Public Address -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="AddressPublic" class="col-form-label col-md-3 col-12">Public Address</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:input type="text" class="form-control" id="AddressPublic" path="address" value="${user.getAddress()}" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- City -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="City" class="col-form-label col-md-3 col-12">City</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:input type="text" class="form-control" id="City" path="city" value="${user.getCity()}" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Country -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="Country" class="col-form-label col-md-3 col-12">Country</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:select id="country" class="form-select" path="country" value="${user.getCountry()}">
                                                                            <option selected disabled value="none">Please Select</option>
                                                                            <option value="Afganistan">Afghanistan</option>
                                                                            <option value="Albania">Albania</option>
                                                                            <option value="Algeria">Algeria</option>
                                                                            <option value="American Samoa">American Samoa</option>
                                                                            <option value="Andorra">Andorra</option>
                                                                            <option value="Angola">Angola</option>
                                                                            <option value="Anguilla">Anguilla</option>
                                                                            <option value="Antigua & Barbuda">Antigua & Barbuda</option>
                                                                            <option value="Argentina">Argentina</option>
                                                                            <option value="Armenia">Armenia</option>
                                                                            <option value="Aruba">Aruba</option>
                                                                            <option value="Australia">Australia</option>
                                                                            <option value="Austria">Austria</option>
                                                                            <option value="Azerbaijan">Azerbaijan</option>
                                                                            <option value="Bahamas">Bahamas</option>
                                                                            <option value="Bahrain">Bahrain</option>
                                                                            <option value="Bangladesh">Bangladesh</option>
                                                                            <option value="Barbados">Barbados</option>
                                                                            <option value="Belarus">Belarus</option>
                                                                            <option value="Belgium">Belgium</option>
                                                                            <option value="Belize">Belize</option>
                                                                            <option value="Benin">Benin</option>
                                                                            <option value="Bermuda">Bermuda</option>
                                                                            <option value="Bhutan">Bhutan</option>
                                                                            <option value="Bolivia">Bolivia</option>
                                                                            <option value="Bonaire">Bonaire</option>
                                                                            <option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
                                                                            <option value="Botswana">Botswana</option>
                                                                            <option value="Brazil">Brazil</option>
                                                                            <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                                                                            <option value="Brunei">Brunei</option>
                                                                            <option value="Bulgaria">Bulgaria</option>
                                                                            <option value="Burkina Faso">Burkina Faso</option>
                                                                            <option value="Burundi">Burundi</option>
                                                                            <option value="Cambodia">Cambodia</option>
                                                                            <option value="Cameroon">Cameroon</option>
                                                                            <option value="Canada">Canada</option>
                                                                            <option value="Canary Islands">Canary Islands</option>
                                                                            <option value="Cape Verde">Cape Verde</option>
                                                                            <option value="Cayman Islands">Cayman Islands</option>
                                                                            <option value="Central African Republic">Central African Republic</option>
                                                                            <option value="Chad">Chad</option>
                                                                            <option value="Channel Islands">Channel Islands</option>
                                                                            <option value="Chile">Chile</option>
                                                                            <option value="China">China</option>
                                                                            <option value="Christmas Island">Christmas Island</option>
                                                                            <option value="Cocos Island">Cocos Island</option>
                                                                            <option value="Colombia">Colombia</option>
                                                                            <option value="Comoros">Comoros</option>
                                                                            <option value="Congo">Congo</option>
                                                                            <option value="Cook Islands">Cook Islands</option>
                                                                            <option value="Costa Rica">Costa Rica</option>
                                                                            <option value="Cote DIvoire">Cote DIvoire</option>
                                                                            <option value="Croatia">Croatia</option>
                                                                            <option value="Cuba">Cuba</option>
                                                                            <option value="Curaco">Curacao</option>
                                                                            <option value="Cyprus">Cyprus</option>
                                                                            <option value="Czech Republic">Czech Republic</option>
                                                                            <option value="Denmark">Denmark</option>
                                                                            <option value="Djibouti">Djibouti</option>
                                                                            <option value="Dominica">Dominica</option>
                                                                            <option value="Dominican Republic">Dominican Republic</option>
                                                                            <option value="East Timor">East Timor</option>
                                                                            <option value="Ecuador">Ecuador</option>
                                                                            <option value="Egypt">Egypt</option>
                                                                            <option value="El Salvador">El Salvador</option>
                                                                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                                            <option value="Eritrea">Eritrea</option>
                                                                            <option value="Estonia">Estonia</option>
                                                                            <option value="Ethiopia">Ethiopia</option>
                                                                            <option value="Falkland Islands">Falkland Islands</option>
                                                                            <option value="Faroe Islands">Faroe Islands</option>
                                                                            <option value="Fiji">Fiji</option>
                                                                            <option value="Finland">Finland</option>
                                                                            <option value="France">France</option>
                                                                            <option value="French Guiana">French Guiana</option>
                                                                            <option value="French Polynesia">French Polynesia</option>
                                                                            <option value="French Southern Ter">French Southern Ter</option>
                                                                            <option value="Gabon">Gabon</option>
                                                                            <option value="Gambia">Gambia</option>
                                                                            <option value="Georgia">Georgia</option>
                                                                            <option value="Germany">Germany</option>
                                                                            <option value="Ghana">Ghana</option>
                                                                            <option value="Gibraltar">Gibraltar</option>
                                                                            <option value="Great Britain">Great Britain</option>
                                                                            <option value="Greece">Greece</option>
                                                                            <option value="Greenland">Greenland</option>
                                                                            <option value="Grenada">Grenada</option>
                                                                            <option value="Guadeloupe">Guadeloupe</option>
                                                                            <option value="Guam">Guam</option>
                                                                            <option value="Guatemala">Guatemala</option>
                                                                            <option value="Guinea">Guinea</option>
                                                                            <option value="Guyana">Guyana</option>
                                                                            <option value="Haiti">Haiti</option>
                                                                            <option value="Hawaii">Hawaii</option>
                                                                            <option value="Honduras">Honduras</option>
                                                                            <option value="Hong Kong">Hong Kong</option>
                                                                            <option value="Hungary">Hungary</option>
                                                                            <option value="Iceland">Iceland</option>
                                                                            <option value="Indonesia">Indonesia</option>
                                                                            <option value="India">India</option>
                                                                            <option value="Iran">Iran</option>
                                                                            <option value="Iraq">Iraq</option>
                                                                            <option value="Ireland">Ireland</option>
                                                                            <option value="Isle of Man">Isle of Man</option>
                                                                            <option value="Israel">Israel</option>
                                                                            <option value="Italy">Italy</option>
                                                                            <option value="Jamaica">Jamaica</option>
                                                                            <option value="Japan">Japan</option>
                                                                            <option value="Jordan">Jordan</option>
                                                                            <option value="Kazakhstan">Kazakhstan</option>
                                                                            <option value="Kenya">Kenya</option>
                                                                            <option value="Kiribati">Kiribati</option>
                                                                            <option value="Korea North">Korea North</option>
                                                                            <option value="Korea Sout">Korea South</option>
                                                                            <option value="Kuwait">Kuwait</option>
                                                                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                                            <option value="Laos">Laos</option>
                                                                            <option value="Latvia">Latvia</option>
                                                                            <option value="Lebanon">Lebanon</option>
                                                                            <option value="Lesotho">Lesotho</option>
                                                                            <option value="Liberia">Liberia</option>
                                                                            <option value="Libya">Libya</option>
                                                                            <option value="Liechtenstein">Liechtenstein</option>
                                                                            <option value="Lithuania">Lithuania</option>
                                                                            <option value="Luxembourg">Luxembourg</option>
                                                                            <option value="Macau">Macau</option>
                                                                            <option value="Macedonia">Macedonia</option>
                                                                            <option value="Madagascar">Madagascar</option>
                                                                            <option value="Malaysia">Malaysia</option>
                                                                            <option value="Malawi">Malawi</option>
                                                                            <option value="Maldives">Maldives</option>
                                                                            <option value="Mali">Mali</option>
                                                                            <option value="Malta">Malta</option>
                                                                            <option value="Marshall Islands">Marshall Islands</option>
                                                                            <option value="Martinique">Martinique</option>
                                                                            <option value="Mauritania">Mauritania</option>
                                                                            <option value="Mauritius">Mauritius</option>
                                                                            <option value="Mayotte">Mayotte</option>
                                                                            <option value="Mexico">Mexico</option>
                                                                            <option value="Midway Islands">Midway Islands</option>
                                                                            <option value="Moldova">Moldova</option>
                                                                            <option value="Monaco">Monaco</option>
                                                                            <option value="Mongolia">Mongolia</option>
                                                                            <option value="Montserrat">Montserrat</option>
                                                                            <option value="Morocco">Morocco</option>
                                                                            <option value="Mozambique">Mozambique</option>
                                                                            <option value="Myanmar">Myanmar</option>
                                                                            <option value="Nambia">Nambia</option>
                                                                            <option value="Nauru">Nauru</option>
                                                                            <option value="Nepal">Nepal</option>
                                                                            <option value="Netherland Antilles">Netherland Antilles</option>
                                                                            <option value="Netherlands">Netherlands (Holland, Europe)</option>
                                                                            <option value="Nevis">Nevis</option>
                                                                            <option value="New Caledonia">New Caledonia</option>
                                                                            <option value="New Zealand">New Zealand</option>
                                                                            <option value="Nicaragua">Nicaragua</option>
                                                                            <option value="Niger">Niger</option>
                                                                            <option value="Nigeria">Nigeria</option>
                                                                            <option value="Niue">Niue</option>
                                                                            <option value="Norfolk Island">Norfolk Island</option>
                                                                            <option value="Norway">Norway</option>
                                                                            <option value="Oman">Oman</option>
                                                                            <option value="Pakistan">Pakistan</option>
                                                                            <option value="Palau Island">Palau Island</option>
                                                                            <option value="Palestine">Palestine</option>
                                                                            <option value="Panama">Panama</option>
                                                                            <option value="Papua New Guinea">Papua New Guinea</option>
                                                                            <option value="Paraguay">Paraguay</option>
                                                                            <option value="Peru">Peru</option>
                                                                            <option value="Phillipines">Philippines</option>
                                                                            <option value="Pitcairn Island">Pitcairn Island</option>
                                                                            <option value="Poland">Poland</option>
                                                                            <option value="Portugal">Portugal</option>
                                                                            <option value="Puerto Rico">Puerto Rico</option>
                                                                            <option value="Qatar">Qatar</option>
                                                                            <option value="Republic of Montenegro">Republic of Montenegro</option>
                                                                            <option value="Republic of Serbia">Republic of Serbia</option>
                                                                            <option value="Reunion">Reunion</option>
                                                                            <option value="Romania">Romania</option>
                                                                            <option value="Russia">Russia</option>
                                                                            <option value="Rwanda">Rwanda</option>
                                                                            <option value="St Barthelemy">St Barthelemy</option>
                                                                            <option value="St Eustatius">St Eustatius</option>
                                                                            <option value="St Helena">St Helena</option>
                                                                            <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                                                                            <option value="St Lucia">St Lucia</option>
                                                                            <option value="St Maarten">St Maarten</option>
                                                                            <option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
                                                                            <option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
                                                                            <option value="Saipan">Saipan</option>
                                                                            <option value="Samoa">Samoa</option>
                                                                            <option value="Samoa American">Samoa American</option>
                                                                            <option value="San Marino">San Marino</option>
                                                                            <option value="Sao Tome & Principe">Sao Tome & Principe</option>
                                                                            <option value="Saudi Arabia">Saudi Arabia</option>
                                                                            <option value="Senegal">Senegal</option>
                                                                            <option value="Seychelles">Seychelles</option>
                                                                            <option value="Sierra Leone">Sierra Leone</option>
                                                                            <option value="Singapore">Singapore</option>
                                                                            <option value="Slovakia">Slovakia</option>
                                                                            <option value="Slovenia">Slovenia</option>
                                                                            <option value="Solomon Islands">Solomon Islands</option>
                                                                            <option value="Somalia">Somalia</option>
                                                                            <option value="South Africa">South Africa</option>
                                                                            <option value="Spain">Spain</option>
                                                                            <option value="Sri Lanka">Sri Lanka</option>
                                                                            <option value="Sudan">Sudan</option>
                                                                            <option value="Suriname">Suriname</option>
                                                                            <option value="Swaziland">Swaziland</option>
                                                                            <option value="Sweden">Sweden</option>
                                                                            <option value="Switzerland">Switzerland</option>
                                                                            <option value="Syria">Syria</option>
                                                                            <option value="Tahiti">Tahiti</option>
                                                                            <option value="Taiwan">Taiwan</option>
                                                                            <option value="Tajikistan">Tajikistan</option>
                                                                            <option value="Tanzania">Tanzania</option>
                                                                            <option value="Thailand">Thailand</option>
                                                                            <option value="Togo">Togo</option>
                                                                            <option value="Tokelau">Tokelau</option>
                                                                            <option value="Tonga">Tonga</option>
                                                                            <option value="Trinidad & Tobago">Trinidad & Tobago</option>
                                                                            <option value="Tunisia">Tunisia</option>
                                                                            <option value="Turkey">Turkey</option>
                                                                            <option value="Turkmenistan">Turkmenistan</option>
                                                                            <option value="Turks & Caicos Is">Turks & Caicos Is</option>
                                                                            <option value="Tuvalu">Tuvalu</option>
                                                                            <option value="Uganda">Uganda</option>
                                                                            <option value="United Kingdom">United Kingdom</option>
                                                                            <option value="Ukraine">Ukraine</option>
                                                                            <option value="United Arab Erimates">United Arab Emirates</option>
                                                                            <option value="United States of America">United States of America</option>
                                                                            <option value="Uraguay">Uruguay</option>
                                                                            <option value="Uzbekistan">Uzbekistan</option>
                                                                            <option value="Vanuatu">Vanuatu</option>
                                                                            <option value="Vatican City State">Vatican City State</option>
                                                                            <option value="Venezuela">Venezuela</option>
                                                                            <option value="Vietnam">Vietnam</option>
                                                                            <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                                                                            <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                                                                            <option value="Wake Island">Wake Island</option>
                                                                            <option value="Wallis & Futana Is">Wallis & Futana Is</option>
                                                                            <option value="Yemen">Yemen</option>
                                                                            <option value="Zaire">Zaire</option>
                                                                            <option value="Zambia">Zambia</option>
                                                                            <option value="Zimbabwe">Zimbabwe</option>
                                                                        </sf:select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Contact Information -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="ContactInfo" class="col-form-label col-md-3 col-12">Contact Number</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:input type="tel" class="form-control" id="phone" name="contactNo" path="contactNumber" />
                                                                        <c:if test="${ contact ne \"none\"}">
                                                                            <span class="text-danger">Invalid contact format</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Nationality -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="Nationality" class="col-form-label col-md-3 col-12">Nationality</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:select id="Nationality" class="form-select" path="nationality" value="${user.getNationality()}">
                                                                            <option selected disabled value="none">Please Select</option>
                                                                            <option value='afghan'>Afghan</option>
                                                                            <option value='albanian'>Albanian</option>
                                                                            <option value='algerian'>Algerian</option>
                                                                            <option value='american'>American</option>
                                                                            <option value='andorran'>Andorran</option>
                                                                            <option value='angolan'>Angolan</option>
                                                                            <option value='anguillan'>Anguillan</option>
                                                                            <option value='citizen-of-antigua-and-barbuda'>Citizen of Antigua and Barbuda</option>
                                                                            <option value='argentine'>Argentine</option>
                                                                            <option value='armenianaustralian'>ArmenianAustralian</option>
                                                                            <option value='austrian'>Austrian</option>
                                                                            <option value='azerbaijani'>Azerbaijani</option>
                                                                            <option value='bahamian'>Bahamian</option>
                                                                            <option value='bahraini'>Bahraini</option>
                                                                            <option value='bangladeshi'>Bangladeshi</option>
                                                                            <option value='barbadian'>Barbadian</option>
                                                                            <option value='belarusian'>Belarusian</option>
                                                                            <option value='belgian'>Belgian</option>
                                                                            <option value='belizean'>Belizean</option>
                                                                            <option value='beninese'>Beninese</option>
                                                                            <option value='bermudian'>Bermudian</option>
                                                                            <option value='bhutanese'>Bhutanese</option>
                                                                            <option value='bolivian'>Bolivian</option>
                                                                            <option value='citizen-of-bosnia-and-herzegovina'>Citizen of Bosnia and Herzegovina</option>
                                                                            <option value='botswanan'>Botswanan</option>
                                                                            <option value='brazilian'>Brazilian</option>
                                                                            <option value='british'>British</option>
                                                                            <option value='british-virgin-islander'>British Virgin Islander</option>
                                                                            <option value='bruneian'>Bruneian</option>
                                                                            <option value='bulgarian'>Bulgarian</option>
                                                                            <option value='burkinan'>Burkinan</option>
                                                                            <option value='burmese'>Burmese</option>
                                                                            <option value='burundian'>Burundian</option>
                                                                            <option value='cambodian'>Cambodian</option>
                                                                            <option value='cameroonian'>Cameroonian</option>
                                                                            <option value='canadian'>Canadian</option>
                                                                            <option value='cape-verdean'>Cape Verdean</option>
                                                                            <option value='cayman-islander'>Cayman Islander</option>
                                                                            <option value='central-african'>Central African</option>
                                                                            <option value='chadian'>Chadian</option>
                                                                            <option value='chilean'>Chilean</option>
                                                                            <option value='chinese'>Chinese</option>
                                                                            <option value='colombian'>Colombian</option>
                                                                            <option value='comoran'>Comoran</option>
                                                                            <option value='congolese-(congo)'>Congolese (Congo)</option>
                                                                            <option value='congolese-(drc)'>Congolese (DRC)</option>
                                                                            <option value='cook-islander'>Cook Islander</option>
                                                                            <option value='costa-rican'>Costa Rican</option>
                                                                            <option value='croatian'>Croatian</option>
                                                                            <option value='cuban'>Cuban</option>
                                                                            <option value='cymraes'>Cymraes</option>
                                                                            <option value='cymro'>Cymro</option>
                                                                            <option value='cypriot'>Cypriot</option>
                                                                            <option value='czech'>Czech</option>
                                                                            <option value='danish'>Danish</option>
                                                                            <option value='djiboutian'>Djiboutian</option>
                                                                            <option value='dominican'>Dominican</option>
                                                                            <option value='citizen-of-the-dominican-republic'>Citizen of the Dominican Republic</option>
                                                                            <option value='dutch'>Dutch</option>
                                                                            <option value='east-timorese'>East Timorese</option>
                                                                            <option value='ecuadorean'>Ecuadorean</option>
                                                                            <option value='egyptian'>Egyptian</option>
                                                                            <option value='emirati'>Emirati</option>
                                                                            <option value='english'>English</option>
                                                                            <option value='equatorial-guinean'>Equatorial Guinean</option>
                                                                            <option value='eritrean'>Eritrean</option>
                                                                            <option value='estonian'>Estonian</option>
                                                                            <option value='ethiopian'>Ethiopian</option>
                                                                            <option value='faroese'>Faroese</option>
                                                                            <option value='fijian'>Fijian</option>
                                                                            <option value='filipino'>Filipino</option>
                                                                            <option value='finnish'>Finnish</option>
                                                                            <option value='french'>French</option>
                                                                            <option value='gabonese'>Gabonese</option>
                                                                            <option value='gambian'>Gambian</option>
                                                                            <option value='georgian'>Georgian</option>
                                                                            <option value='german'>German</option>
                                                                            <option value='ghanaian'>Ghanaian</option>
                                                                            <option value='gibraltarian'>Gibraltarian</option>
                                                                            <option value='greek'>Greek</option>
                                                                            <option value='greenlandic'>Greenlandic</option>
                                                                            <option value='grenadian'>Grenadian</option>
                                                                            <option value='guamanian'>Guamanian</option>
                                                                            <option value='guatemalan'>Guatemalan</option>
                                                                            <option value='citizen-of-guinea-bissau'>Citizen of Guinea-Bissau</option>
                                                                            <option value='guinean'>Guinean</option>
                                                                            <option value='guyanese'>Guyanese</option>
                                                                            <option value='haitian'>Haitian</option>
                                                                            <option value='honduran'>Honduran</option>
                                                                            <option value='hong-konger'>Hong Konger</option>
                                                                            <option value='hungarian'>Hungarian</option>
                                                                            <option value='icelandic'>Icelandic</option>
                                                                            <option value='indian'>Indian</option>
                                                                            <option value='indonesian'>Indonesian</option>
                                                                            <option value='iranian'>Iranian</option>
                                                                            <option value='iraqi'>Iraqi</option>
                                                                            <option value='irish'>Irish</option>
                                                                            <option value='israeli'>Israeli</option>
                                                                            <option value='italian'>Italian</option>
                                                                            <option value='ivorian'>Ivorian</option>
                                                                            <option value='jamaican'>Jamaican</option>
                                                                            <option value='japanese'>Japanese</option>
                                                                            <option value='jordanian'>Jordanian</option>
                                                                            <option value='kazakh'>Kazakh</option>
                                                                            <option value='kenyan'>Kenyan</option>
                                                                            <option value='kittitian'>Kittitian</option>
                                                                            <option value='citizen-of-kiribati'>Citizen of Kiribati</option>
                                                                            <option value='kosovan'>Kosovan</option>
                                                                            <option value='kuwaiti'>Kuwaiti</option>
                                                                            <option value='kyrgyz'>Kyrgyz</option>
                                                                            <option value='lao'>Lao</option>
                                                                            <option value='latvian'>Latvian</option>
                                                                            <option value='lebanese'>Lebanese</option>
                                                                            <option value='liberian'>Liberian</option>
                                                                            <option value='libyan'>Libyan</option>
                                                                            <option value='liechtenstein-citizen'>Liechtenstein citizen</option>
                                                                            <option value='lithuanian'>Lithuanian</option>
                                                                            <option value='luxembourger'>Luxembourger</option>
                                                                            <option value='macanese'>Macanese</option>
                                                                            <option value='macedonian'>Macedonian</option>
                                                                            <option value='malagasy'>Malagasy</option>
                                                                            <option value='malawian'>Malawian</option>
                                                                            <option value='malaysian'>Malaysian</option>
                                                                            <option value='maldivian'>Maldivian</option>
                                                                            <option value='malian'>Malian</option>
                                                                            <option value='maltese'>Maltese</option>
                                                                            <option value='marshallese'>Marshallese</option>
                                                                            <option value='martiniquais'>Martiniquais</option>
                                                                            <option value='mauritanian'>Mauritanian</option>
                                                                            <option value='mauritian'>Mauritian</option>
                                                                            <option value='mexican'>Mexican</option>
                                                                            <option value='micronesian'>Micronesian</option>
                                                                            <option value='moldovan'>Moldovan</option>
                                                                            <option value='monegasque'>Monegasque</option>
                                                                            <option value='mongolian'>Mongolian</option>
                                                                            <option value='montenegrin'>Montenegrin</option>
                                                                            <option value='montserratian'>Montserratian</option>
                                                                            <option value='moroccan'>Moroccan</option>
                                                                            <option value='mosotho'>Mosotho</option>
                                                                            <option value='mozambican'>Mozambican</option>
                                                                            <option value='namibian'>Namibian</option>
                                                                            <option value='nauruan'>Nauruan</option>
                                                                            <option value='nepalese'>Nepalese</option>
                                                                            <option value='new-zealander'>New Zealander</option>
                                                                            <option value='nicaraguan'>Nicaraguan</option>
                                                                            <option value='nigerian'>Nigerian</option>
                                                                            <option value='nigerien'>Nigerien</option>
                                                                            <option value='niuean'>Niuean</option>
                                                                            <option value='north-korean'>North Korean</option>
                                                                            <option value='northern-irish'>Northern Irish</option>
                                                                            <option value='norwegian'>Norwegian</option>
                                                                            <option value='omani'>Omani</option>
                                                                            <option value='pakistani'>Pakistani</option>
                                                                            <option value='palauan'>Palauan</option>
                                                                            <option value='palestinian'>Palestinian</option>
                                                                            <option value='panamanian'>Panamanian</option>
                                                                            <option value='papua-new-guinean'>Papua New Guinean</option>
                                                                            <option value='paraguayan'>Paraguayan</option>
                                                                            <option value='peruvian'>Peruvian</option>
                                                                            <option value='pitcairn-islander'>Pitcairn Islander</option>
                                                                            <option value='polish'>Polish</option>
                                                                            <option value='portuguese'>Portuguese</option>
                                                                            <option value='prydeinig'>Prydeinig</option>
                                                                            <option value='puerto-rican'>Puerto Rican</option>
                                                                            <option value='qatari'>Qatari</option>
                                                                            <option value='romanian'>Romanian</option>
                                                                            <option value='russian'>Russian</option>
                                                                            <option value='rwandan'>Rwandan</option>
                                                                            <option value='salvadorean'>Salvadorean</option>
                                                                            <option value='sammarinese'>Sammarinese</option>
                                                                            <option value='samoan'>Samoan</option>
                                                                            <option value='sao-tomean'>Sao Tomean</option>
                                                                            <option value='saudi-arabian'>Saudi Arabian</option>
                                                                            <option value='scottish'>Scottish</option>
                                                                            <option value='senegalese'>Senegalese</option>
                                                                            <option value='serbian'>Serbian</option>
                                                                            <option value='citizen-of-seychelles'>Citizen of Seychelles</option>
                                                                            <option value='sierra-leonean'>Sierra Leonean</option>
                                                                            <option value='singaporean'>Singaporean</option>
                                                                            <option value='slovak'>Slovak</option>
                                                                            <option value='slovenian'>Slovenian</option>
                                                                            <option value='solomon-islander'>Solomon Islander</option>
                                                                            <option value='somali'>Somali</option>
                                                                            <option value='south-african'>South African</option>
                                                                            <option value='south-korean'>South Korean</option>
                                                                            <option value='south-sudanese'>South Sudanese</option>
                                                                            <option value='spanish'>Spanish</option>
                                                                            <option value='sri-lankan'>Sri Lankan</option>
                                                                            <option value='st-helenian'>St Helenian</option>
                                                                            <option value='st-lucian'>St Lucian</option>
                                                                            <option value='stateless'>Stateless</option>
                                                                            <option value='sudanese'>Sudanese</option>
                                                                            <option value='surinamese'>Surinamese</option>
                                                                            <option value='swazi'>Swazi</option>
                                                                            <option value='swedish'>Swedish</option>
                                                                            <option value='swiss'>Swiss</option>
                                                                            <option value='syrian'>Syrian</option>
                                                                            <option value='taiwanese'>Taiwanese</option>
                                                                            <option value='tajik'>Tajik</option>
                                                                            <option value='tanzanian'>Tanzanian</option>
                                                                            <option value='thai'>Thai</option>
                                                                            <option value='togolese'>Togolese</option>
                                                                            <option value='tongan'>Tongan</option>
                                                                            <option value='trinidadian'>Trinidadian</option>
                                                                            <option value='tristanian'>Tristanian</option>
                                                                            <option value='tunisian'>Tunisian</option>
                                                                            <option value='turkish'>Turkish</option>
                                                                            <option value='turkmen'>Turkmen</option>
                                                                            <option value='turks-and-caicos-islander'>Turks and Caicos Islander</option>
                                                                            <option value='tuvaluan'>Tuvaluan</option>
                                                                            <option value='ugandan'>Ugandan</option>
                                                                            <option value='ukrainian'>Ukrainian</option>
                                                                            <option value='uruguayan'>Uruguayan</option>
                                                                            <option value='uzbek'>Uzbek</option>
                                                                            <option value='vatican-citizen'>Vatican citizen</option>
                                                                            <option value='citizen-of-vanuatu'>Citizen of Vanuatu</option>
                                                                            <option value='venezuelan'>Venezuelan</option>
                                                                            <option value='vietnamese'>Vietnamese</option>
                                                                            <option value='vincentian'>Vincentian</option>
                                                                            <option value='wallisian'>Wallisian</option>
                                                                            <option value='welsh'>Welsh</option>
                                                                            <option value='yemeni'>Yemeni</option>
                                                                            <option value='zambian'>Zambian</option>
                                                                            <option value='zimbabwean'>Zimbabwean</option>
                                                                        </sf:select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--job-->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="Affiliations" class="col-form-label col-md-3 col-12">Job Position</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:input type="text" class="form-control" path="job" value="${user.getJob()}" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Affiliation -->
                                                            <div class="col-12">
                                                                <div class="form-group row">
                                                                    <label for="Affiliations" class="col-form-label col-md-3 col-12">Affiliations</label>
                                                                    <div class="col-md-9 col-12">
                                                                        <sf:input type="text" class="form-control" id="Affiliations" path="company" value="${user.getCompany()}" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <button type="submit" class="btn btn-outline-success w-100">Update Primary Information</button>
                                                            </div>
                                                        </sf:form>
                                                    </div>
                                                </div>

                                                <!-- Biography -->
                                                <div class="col-12 card">
                                                    <div class="card-body">
                                                        <form class="form" method="post" action="/edit-biography">
                                                            <label for="BioSection" class="h3 px-3 form-label text-success">Biography</label>
                                                            <textarea class="w-100 form-control border rounded my-3" name="biography" style="min-height: 10rem;" id="BioSection" placeholder="${user.getBiography()}">
                                        </textarea>
                                                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                            <button class="btn btn-outline-success">Update biography</button>
                                                        </form>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="fixed-bottom bg-light">

                            <a href="/Profile?UID=${UID}" class="d-flex justify-content-center btn btn-success">Finish Editing</a>
                        </footer>
                        <script>
                            const phoneInputField = document.querySelector("#phone");
                            const phoneInput = window.intlTelInput(phoneInputField, {
                                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
                            });

                            $(document).ready(function() {
                                $('.iti__flag-container').click(function() {
                                    var countryCode = $('.iti__selected-flag').attr('title');
                                    var countryCode = countryCode.replace(/[^0-9]/g, '')
                                    $('#phone').val("");
                                    $('#phone').val("+" + countryCode + " " + $('#phone').val());
                                });
                            });
                        </script>
                    </body>

                    </html>