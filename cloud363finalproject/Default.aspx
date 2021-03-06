<!DOCTYPE html>
<html>

<head>
    <title>Cloud-363 Speech Translator</title>
    <meta charset="utf-8" />
    <script type="text/javascript" src="./difflib-browser.js"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body style="font-family:'Helvetica Neue',Helvetica,Arial,sans-serif; font-size:13px;">
    <div class="container" id="content" style="display:none">
        <table class="align-content-center" >
            <div>
                <h1 class="h1 text-center pb-5" style="font-weight:500;">Cloud 363 - Speech Translator</h1>
            </div>
            <tr style="display: none;" >
                <td align="right"><a href="https://www.microsoft.com/cognitive-services/sign-up"
                        target="_blank">Subscription</a>:</td>
                <td><input id="key" value="5fe484f0bb6447dc9acc1ab1e0f21193" type="text" size="60" placeholder="required: speech subscription key"></td>
            </tr>
            <tr style="display: none;" >
                <td align="right">Region:</td>
                <td align="left">
                    <select id="regionOptions">
                        <option value="westus" >West US</option>
                        <option selected="selected" value="westus2">West US 2</option>
                        <option value="eastus">East US</option>
                        <option value="eastus2">East US 2</option>
                        <option value="eastasia">East Asia</option>
                        <option value="southeastasia">South East Asia</option>
                        <option value="northeurope">North Europe</option>
                        <option value="westeurope">West Europe</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Recognition language:</td>
                <td align="left">
                    <select class="form-select" id="languageOptions">
                        <option value="ar-EG">Arabic - EG</option>
                        <option value="ca-ES">Catalan - ES</option>
                        <option value="zh-CN">Chinese - CN</option>
                        <option value="zh-HK">Chinese - HK</option>
                        <option value="zh-TW">Chinese - TW</option>
                        <option value="da-DK">Danish - DK</option>
                        <option value="da-DK">Danish - DK</option>
                        <option value="nl-NL">Dutch - NL</option>
                        <option value="en-AU">English - AU</option>
                        <option value="en-CA">English - CA</option>
                        <option value="en-GB">English - GB</option>
                        <option value="en-IN">English - IN</option>
                        <option value="en-NZ">English - NZ</option>
                        <option value="en-US" selected="selected">English - US</option>
                        <option value="de-DE">German - DE</option>
                        <option value="es-ES">Spanish - ES</option>
                        <option value="es-MX">Spanish - MX</option>
                        <option value="fi-FI">Finnish - FI</option>
                        <option value="fr-CA">French - CA</option>
                        <option value="fr-FR">French - FR</option>
                        <option value="hi-IN">Hindi - IN</option>
                        <option value="it-IT">Italian - IT</option>
                        <option value="ja-JP">Japanese - JP</option>
                        <option value="ko-KR">Korean - KR</option>
                        <option value="nb-NO">Norwegian - NO</option>
                        <option value="pl-PL">Polish - PL</option>
                        <option value="pt-BR">Portuguese - BR</option>
                        <option value="pt-PT">Portuguese - PT</option>
                        <option value="ru-RU">Russian - RU</option>
                        <option value="sv-SE">Swedish - SE</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Audio Input:</td>
                <td align="left">
                    <input
						style="display: none;"
						type="radio"
                        name="inputSourceOption"
                        checked="checked"
                        id="inputSourceMicrophoneRadio"
                        value="Microphone"/>
                    <select class="form-select" id="microphoneSources" disabled="true"/>
                    <input style="display: none;" type="radio"
                        name="inputSourceOption"
                        id="inputSourceFileRadio"
                        value="File"/>
                   
                    <button class="d-none" id="inputSourceChooseFileButton" disabled="true">...</button>
                    <input class="d-none" type="file" id="filePicker" accept=".wav" style="display:none" />
                </td>
            </tr>
            <tr style="display: none;" >
                <td align="right">Scenario:</td>
                <td align="left">
                    <select id="scenarioSelection">
                        <option value="speechRecognizerRecognizeOnce">Single-shot speech-to-text</option>
                        <option value="speechRecognizerContinuous">Continuous speech-to-text</option>
                        <option value="intentRecognizerRecognizeOnce">Single-shot intent recognition</option>
                        <option selected="selected" value="translationRecognizerContinuous">Continuous translation</option>
                        <option value="pronunciationAssessmentOnce">Single-shot pronunciation assessment</option>
                        <option value="pronunciationAssessmentContinuous">Continuous pronunciation assessment</option>
                    </select>
                </td>
            </tr>
            <tr id="formatOptionRow">
                <td align="right">Result Format:</td>
                <td align="left">
                    <input type="radio"
                        name="formatOption"
                        checked="checked"
                        id ="formatSimpleRadio"
                        value="Simple"/>
                    <label for="formatSimpleRadio">Simple</label>
                    <input type="radio"
                        name="formatOption"
                        id ="formatDetailedRadio"
                        value="Detailed"/>
                    <label for="formatDetailedRadio">Detailed</label>
                </td>
            </tr>
            <tr id="translationOptionsRow">
                <td align="right">Target Language:</td>
                <td>
                    <!-- For a full list of supported languages see:
                        https://docs.microsoft.com/azure/cognitive-services/speech-service/language-support#text-to-speech-->
                    <select class="form-select" id="languageTargetOptions">
                        <option value="Microsoft Server Speech Text to Speech Voice (ar-EG, Hoda)">Arabic - EG</option>
                        <option value="Microsoft Server Speech Text to Speech Voice (ca-ES, HerenaRUS)">Catalan - ES
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (da-DK, HelleRUS)">Danish - DK
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (de-DE, Hedda)" selected="selected">
                            German - DE</option>
                        <option value="Microsoft Server Speech Text to Speech Voice (en-AU, Catherine)">English - AU
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (en-CA, Linda)">English - CA
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (en-GB, Susan, Apollo)">English - GB
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (en-IN, Heera, Apollo)">English - IN
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (en-US, ZiraRUS)">English - US
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (es-ES, Laura, Apollo)">Spanish - ES
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (es-MX, HildaRUS)">Spanish - MX
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (fi-FI, HeidiRUS)">Finnish - FI
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (fr-CA, Caroline)">French - CA
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (fr-FR, Julie, Apollo)">French - FR
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (hi-IN, Hemant)">Hindi - IN</option>
                        <option value="Microsoft Server Speech Text to Speech Voice (it-IT, LuciaRUS)">Italian - IT
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (ja-JP, Ayumi, Apollo)">Japanese -
                            JP</option>
                        <option value="Microsoft Server Speech Text to Speech Voice (ko-KR, HeamiRUS)">Korean - KR
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (nb-NO, HuldaRUS)">Norwegian - NO
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (nl-NL, HannaRUS)">Dutch - NL
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (pl-PL, PaulinaRUS)">Polish - PL
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (pt-BR, HeloisaRUS)">Portuguese - BR
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (pt-PT, HeliaRUS)">Portuguese - PT
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (ru-RU, Irina, Apollo)">Russian - RU
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (sv-SE, HedvigRUS)">Swedish - SE
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (zh-CN, Kangkang, Apollo)">Chinese -
                            CN</option>
                        <option value="Microsoft Server Speech Text to Speech Voice (zh-HK, Tracy, Apollo)">Chinese - HK
                        </option>
                        <option value="Microsoft Server Speech Text to Speech Voice (zh-TW, Yating, Apollo)">Chinese -
                            TW</option>
                    </select>
                    <input class="d-none" id="voiceOutput" type="checkbox" checked>
                    <label class="d-none" for="voiceOutput">voice output</label>
                </td>
            </tr>
            <tr id="languageUnderstandingAppIdRow">
                <td align="right">Application ID:</td>
                <td>
                    <input id="appId" type="text" size="60" placeholder="required: appId for the Language Understanding service"/>
                </td>
            </tr>
            <tr style="display: none;" >
                <td align="right">
                    <a href="https://docs.microsoft.com/azure/cognitive-services/speech-service/get-started-speech-to-text#improve-recognition-accuracy">
                        Phrase List Values:
                    </a>
                </td>
                <td>
                    <input id="phrases"
                        type="text"
                        size="60"
                        value=""
                        placeholder="optional: semicolon-delimited list;of;words">
                </td>
            </tr>
            <tr id="pronunciationAssessmentReferenceTextRow">
                <td align="right">
                    Reference Text:
                </td>
                <td>
                    <input id="referenceText"
                        type="text"
                        size="60"
                        value=""
                        placeholder="pronunciation assessment reference text.">
                </td>
            </tr>
            <tr>
                <td align="right"><b></b></td>
                <td  >
                    <button class="btn btn-primary" id="scenarioStartButton">Start</button>
                    <button class="btn btn-danger"  id="scenarioStopButton" disabled="disabled">Stop</button>
                </td>
            </tr>
            <tr >
                <td align="right">Results:</td>
                <td align="left">
                    <textarea class="form-control" id="phraseDiv" style=" font-size:1.5em; display: inline-block;width:500px;height:200px"></textarea>
                </td>
            </tr>
            <tr style="display: none;">
                <td align="right">Events:</td>
                <td align="left">
                    <textarea id="statusDiv"
                        style="display: inline-block;width:500px;height:200px;overflow: scroll;white-space: nowrap;">
                    </textarea>
                </td>
            </tr>
        </table>
    </div>

    <script src="https://aka.ms/csspeech/jsbrowserpackageraw"></script>

    <script>
		function Initialize(onComplete) {
			if (!!window.SpeechSDK) {
				document.getElementById('content').style.display = 'block';
				document.getElementById('warning').style.display = 'none';
				onComplete(window.SpeechSDK);
			}
		}
	</script>

    <script>
		var SpeechSDK;
		var phraseDiv, statusDiv;
		var key, authorizationToken, appId, phrases;
		var regionOptions;
		var languageOptions, formatOption, filePicker, microphoneSources;
		var useDetailedResults;
		var recognizer;
		var inputSourceMicrophoneRadio, inputSourceFileRadio;
		var scenarioSelection, scenarioStartButton, scenarioStopButton;
		var formatSimpleRadio, formatDetailedRadio;
		var reco;
		var languageTargetOptions, voiceOutput;
		var audioFile;
		var microphoneId;
		var referenceText;
		var pronunciationAssessmentResults;

		var thingsToDisableDuringSession;

		var soundContext = undefined;
		try {
			var AudioContext = window.AudioContext 
				|| window.webkitAudioContext      
				|| false;                          

			if (AudioContext) {
				soundContext = new AudioContext();
			} else {
				alert("Audio context not supported");
			}
		} catch (e) {
			window.console.log("no sound context found, no audio output. " + e);
		}

		function resetUiForScenarioStart() {
			phraseDiv.innerHTML = "";
			statusDiv.innerHTML = "";
			useDetailedResults = document.querySelector('input[name="formatOption"]:checked').value === "Detailed";
			pronunciationAssessmentResults = [];
		}

		document.addEventListener("DOMContentLoaded", function () {
			scenarioStartButton = document.getElementById('scenarioStartButton');
			scenarioStopButton = document.getElementById('scenarioStopButton');
			scenarioSelection = document.getElementById('scenarioSelection');

			phraseDiv = document.getElementById("phraseDiv");
			statusDiv = document.getElementById("statusDiv");
			key = document.getElementById("key");
			appId = document.getElementById("appId");
			phrases = document.getElementById("phrases");
			languageOptions = document.getElementById("languageOptions");
			languageTargetOptions = document.getElementById("languageTargetOptions");
			voiceOutput = document.getElementById("voiceOutput");
			regionOptions = document.getElementById("regionOptions");
			filePicker = document.getElementById('filePicker');
			microphoneSources = document.getElementById("microphoneSources");
			inputSourceFileRadio = document.getElementById('inputSourceFileRadio');
			inputSourceMicrophoneRadio = document.getElementById('inputSourceMicrophoneRadio');
			formatSimpleRadio = document.getElementById('formatSimpleRadio');
			formatDetailedRadio = document.getElementById('formatDetailedRadio');
			referenceText = document.getElementById('referenceText');

			thingsToDisableDuringSession = [
				key,
				regionOptions,
				languageOptions,
				inputSourceMicrophoneRadio,
				inputSourceFileRadio,
				scenarioSelection,
				formatSimpleRadio,
				formatDetailedRadio,
				appId,
				phrases,
				languageTargetOptions
			];

			function setScenario() {
				var startButtonText = (function () {
					switch (scenarioSelection.value) {
						case 'speechRecognizerRecognizeOnce':
						case 'intentRecognizerRecognizeOnce':
						case 'pronunciationAssessmentOnce': return 'recognizeOnceAsync()';
						case 'speechRecognizerContinuous':
						case 'pronunciationAssessmentContinuous': return 'startContinuousRecognitionAsync()';
						case 'translationRecognizerContinuous': return 'Start Translation';
					}
				})();

				scenarioStartButton.innerHTML = startButtonText;
				scenarioStopButton.innerHTML = `Stop Translation`;

				document.getElementById('languageUnderstandingAppIdRow').style.display =
					scenarioSelection.value === 'intentRecognizerRecognizeOnce' ? '' : 'none';

				var detailedResultsSupported =
					(scenarioSelection.value === "speechRecognizerRecognizeOnce"
						|| scenarioSelection.value === "speechRecognizerContinuous");
				document.getElementById('formatOptionRow').style.display = detailedResultsSupported ? '' : 'none';

				document.getElementById('translationOptionsRow').style.display =
					scenarioSelection.value == 'translationRecognizerContinuous' ? '' : 'none';

				document.getElementById('pronunciationAssessmentReferenceTextRow').style.display =
					scenarioSelection.value.includes('pronunciation') ? '' : 'none';
			}

			scenarioSelection.addEventListener("change", function () {
				setScenario();
			});
			setScenario();

			scenarioStartButton.addEventListener("click", function () {
				switch (scenarioSelection.value) {
					case 'speechRecognizerRecognizeOnce':
						doRecognizeOnceAsync();
						break;
					case 'speechRecognizerContinuous':
						doContinuousRecognition();
						break;
					case 'intentRecognizerRecognizeOnce':
						doRecognizeIntentOnceAsync();
						break;
					case 'translationRecognizerContinuous':
						doContinuousTranslation();
						break;
					case 'pronunciationAssessmentOnce':
						doPronunciationAssessmentOnceAsync();
						break;
					case 'pronunciationAssessmentContinuous':
						doContinuousPronunciationAssessment();
						break;
				}
			});

			scenarioStopButton.addEventListener("click", function () {
				switch (scenarioSelection.value) {
					case 'speechRecognizerRecognizeOnce':
					case 'intentRecognizerRecognizeOnce':
					case 'pronunciationAssessmentOnce':
						reco.close();
						reco = undefined;
						break;
					case 'speechRecognizerContinuous':
					case 'translationRecognizerContinuous':
						reco.stopContinuousRecognitionAsync(
							function () {
								reco.close();
								reco = undefined;
							},
							function (err) {
								reco.close();
								reco = undefined;
							}
						);
						break;
				}
			});

			function enumerateMicrophones() {
				if (!navigator || !navigator.mediaDevices || !navigator.mediaDevices.enumerateDevices) {
					console.log(`Unable to query for audio input devices. Default will be used.\r\n`);
					return;
				}

				navigator.mediaDevices.enumerateDevices().then((devices) => {
					microphoneSources.innerHTML = '';

					var defaultOption = document.createElement('option');
					defaultOption.appendChild(document.createTextNode('Default Microphone'));
					microphoneSources.appendChild(defaultOption);

					for (const device of devices) {
						if (device.kind === "audioinput") {
							if (!device.deviceId) {
								window.console.log(
									`Warning: unable to enumerate a microphone deviceId. This may be due to limitations`
									+ ` with availability in a non-HTTPS context per mediaDevices constraints.`);
							}
							else {
								var opt = document.createElement('option');
								opt.value = device.deviceId;
								opt.appendChild(document.createTextNode(device.label));

								microphoneSources.appendChild(opt);
							}
						}
					}

					microphoneSources.disabled = (microphoneSources.options.length == 1);
				});
			}

			inputSourceMicrophoneRadio.addEventListener("click", function () {
				enumerateMicrophones();
				document.getElementById('inputSourceChooseFileButton').disabled = true;
			});

			inputSourceFileRadio.addEventListener("click", function () {
				document.getElementById('inputSourceChooseFileButton').disabled = false;
			});

			document.getElementById('inputSourceChooseFileButton').addEventListener("click", function () {
				document.getElementById('inputSourceFileLabel').innerHTML = 'Select audio file';
				audioFile = undefined;
				filePicker.click();
			});

			filePicker.addEventListener("change", function () {
				audioFile = filePicker.files[0];
				document.getElementById('inputSourceFileLabel').innerHTML = audioFile.name;
			});

			enumerateMicrophones();

			Initialize(function (speechSdk) {
				SpeechSDK = speechSdk;

				if (typeof RequestAuthorizationToken === "function") {
					RequestAuthorizationToken();
				}
			});
		});
	</script>

    <script>
		function getAudioConfig() {
			// If an audio file was specified, use it. Otherwise, use the microphone.
			// Depending on browser security settings, the user may be prompted to allow microphone use. Using
			// continuous recognition allows multiple phrases to be recognized from a single use authorization.
			if (audioFile) {
				return SpeechSDK.AudioConfig.fromWavFileInput(audioFile);
			} else if (inputSourceFileRadio.checked) {
				alert('Please choose a file when selecting file input as your audio source.');
				return;
			} else if (microphoneSources.value) {
				return SpeechSDK.AudioConfig.fromMicrophoneInput(microphoneSources.value);
			} else {
				return SpeechSDK.AudioConfig.fromDefaultMicrophoneInput();
			}
		}

		function getSpeechConfig(sdkConfigType) {
			var speechConfig;
			if (authorizationToken) {
				speechConfig = sdkConfigType.fromAuthorizationToken(authorizationToken, regionOptions.value);
			} else if (!key.value) {
				alert("Please enter your Cognitive Services Speech subscription key!");
				return undefined;
			} else {
				speechConfig = sdkConfigType.fromSubscription(key.value, regionOptions.value);
			}
			if (useDetailedResults && sdkConfigType != SpeechSDK.SpeechConfig) {
				window.console.log('Detailed results are not supported for this scenario.\r\n');
				document.getElementById('formatSimpleRadio').click();
			} else if (useDetailedResults) {
				speechConfig.outputFormat = SpeechSDK.OutputFormat.Detailed;
			}

			if (sdkConfigType == SpeechSDK.SpeechTranslationConfig) {
				speechConfig.addTargetLanguage(languageTargetOptions.value.split("(")[1].substring(0, 5));
			}

			speechConfig.speechRecognitionLanguage = languageOptions.value;
			return speechConfig;
		}

		function getPronunciationAssessmentConfig() {
			var pronunciationAssessmentConfig = new SpeechSDK.PronunciationAssessmentConfig(referenceText.value,
				SpeechSDK.PronunciationAssessmentGradingSystem.HundredMark,
				SpeechSDK.PronunciationAssessmentGranularity.Word, true);
			return pronunciationAssessmentConfig;
		}

		function onRecognizing(sender, recognitionEventArgs) {
			var result = recognitionEventArgs.result;
			statusDiv.innerHTML += `(recognizing) Reason: ${SpeechSDK.ResultReason[result.reason]}`
				+ ` Text: ${result.text}\r\n`;
			phraseDiv.innerHTML = phraseDiv.innerHTML.replace(/(.*)(^|[\r\n]+).*\[\.\.\.\][\r\n]+/, '$1$2')
				+ `${result.text} [...]\r\n`;
			phraseDiv.scrollTop = phraseDiv.scrollHeight;
		}

		function onRecognized(sender, recognitionEventArgs) {
			var result = recognitionEventArgs.result;
			onRecognizedResult(recognitionEventArgs.result);
		}

		function onRecognizedResult(result) {
			phraseDiv.scrollTop = phraseDiv.scrollHeight;

			statusDiv.innerHTML += `(recognized)  Reason: ${SpeechSDK.ResultReason[result.reason]}`;
			if (scenarioSelection.value === 'speechRecognizerRecognizeOnce'
				|| scenarioSelection.value === 'intentRecognizerRecognizeOnce') {
				phraseDiv.innerHTML = '';
			} else {
				phraseDiv.innerHTML = phraseDiv.innerHTML.replace(/(.*)(^|[\r\n]+).*\[\.\.\.\][\r\n]+/, '$1$2');
			}

			switch (result.reason) {
				case SpeechSDK.ResultReason.NoMatch:
					var noMatchDetail = SpeechSDK.NoMatchDetails.fromResult(result);
					statusDiv.innerHTML += ` NoMatchReason: ${SpeechSDK.NoMatchReason[noMatchDetail.reason]}\r\n`;
					break;
				case SpeechSDK.ResultReason.Canceled:
					var cancelDetails = SpeechSDK.CancellationDetails.fromResult(result);
					statusDiv.innerHTML += ` CancellationReason: ${SpeechSDK.CancellationReason[cancelDetails.reason]}`;
					+ (cancelDetails.reason === SpeechSDK.CancellationReason.Error
						? `: ${cancelDetails.errorDetails}` : ``)
						+ `\r\n`;
					break;
				case SpeechSDK.ResultReason.RecognizedSpeech:
				case SpeechSDK.ResultReason.TranslatedSpeech:
				case SpeechSDK.ResultReason.RecognizedIntent:
					statusDiv.innerHTML += `\r\n`;

					if (useDetailedResults) {
						var detailedResultJson = JSON.parse(result.json);
						var displayText = detailedResultJson['DisplayText'];
						phraseDiv.innerHTML += `Detailed result for "${displayText}":\r\n`
							+ `${JSON.stringify(detailedResultJson, null, 2)}\r\n`;
					} else if (result.text) {
						phraseDiv.innerHTML += `${result.text}\r\n`;
					}

					var intentJson = result.properties
						.getProperty(SpeechSDK.PropertyId.LanguageUnderstandingServiceResponse_JsonResult);
					if (intentJson) {
						phraseDiv.innerHTML += `${intentJson}\r\n`;
					}

					if (result.translations) {
						var resultJson = JSON.parse(result.json);
						resultJson['privTranslationPhrase']['Translation']['Translations'].forEach(
							function (translation) {
								phraseDiv.innerHTML += ` [${translation.Language}] ${translation.Text}\r\n`;
							});
					}

					if (scenarioSelection.value.includes('pronunciation')) {
						var pronunciationAssessmentResult = SpeechSDK.PronunciationAssessmentResult.fromResult(result);
						phraseDiv.innerHTML +=
							`[Pronunciation result] Accuracy: ${pronunciationAssessmentResult.accuracyScore}; 
                       Fluency: ${pronunciationAssessmentResult.fluencyScore};
                       Completeness: ${pronunciationAssessmentResult.completenessScore}.\n`;
						pronunciationAssessmentResults.push(pronunciationAssessmentResult);
					}
					break;
			}
		}

		function onSessionStarted(sender, sessionEventArgs) {
			statusDiv.innerHTML += `(sessionStarted) SessionId: ${sessionEventArgs.sessionId}\r\n`;

			for (const thingToDisableDuringSession of thingsToDisableDuringSession) {
				thingToDisableDuringSession.disabled = true;
			}

			scenarioStartButton.disabled = true;
			scenarioStopButton.disabled = false;
		}

		function onSessionStopped(sender, sessionEventArgs) {
			statusDiv.innerHTML += `(sessionStopped) SessionId: ${sessionEventArgs.sessionId}\r\n`;

			if (scenarioSelection.value == 'pronunciationAssessmentContinuous') {
				calculateOverallPronunciationScore();
			}

			for (const thingToDisableDuringSession of thingsToDisableDuringSession) {
				thingToDisableDuringSession.disabled = false;
			}

			scenarioStartButton.disabled = false;
			scenarioStopButton.disabled = true;
		}

		function onCanceled(sender, cancellationEventArgs) {
			window.console.log(e);

			statusDiv.innerHTML += "(cancel) Reason: " + SpeechSDK.CancellationReason[e.reason];
			if (e.reason === SpeechSDK.CancellationReason.Error) {
				statusDiv.innerHTML += ": " + e.errorDetails;
			}
			statusDiv.innerHTML += "\r\n";
		}

		function applyCommonConfigurationTo(recognizer) {

			recognizer.recognizing = onRecognizing;

			recognizer.recognized = onRecognized;

			
			recognizer.canceled = onCanceled;

			
			recognizer.sessionStarted = onSessionStarted;

		
			recognizer.sessionStopped = onSessionStopped;

			if (phrases.value) {
				var phraseListGrammar = SpeechSDK.PhraseListGrammar.fromRecognizer(recognizer);
				phraseListGrammar.addPhrases(phrases.value.split(";"));
			}
		}

		function calculateOverallPronunciationScore() {
			if (difflib === undefined) {
				phraseDiv.innerHTML += `ERROR: difflib-browser.js is needed for pronunciation assessment calculation; see https://github.com/qiao/difflib.js`;
			}
			var referenceWords = referenceText.value.toLowerCase().replace(/[.,\/#!?$%\^&\*;:{}=\-_`~()]/g, "");
			referenceWords = referenceWords.split(' ');

			var recognizedWords = [];
			var sumDuration = 0;
			var sumAccuracy = 0;
			var sumFluency = 0;
			for (const result of pronunciationAssessmentResults) {
				var duration = 0;
				for (const word of result.detailResult.Words) {
					recognizedWords.push(word.Word);
					duration += word.Duration;
				}
				sumDuration += duration;
				sumAccuracy += duration * result.accuracyScore;
				sumFluency += duration * result.fluencyScore;
			}

			var accuracy = sumAccuracy / sumDuration;
			var fluency = sumFluency / sumDuration;

			var diff = new difflib.SequenceMatcher(null, referenceWords, recognizedWords);
			diffWordsNum = 0;
			for (const d of diff.getOpcodes()) {
				if (d[0] == 'delete' || d[0] == 'replace') {
					diffWordsNum += (d[2] - d[1]);
				}
			}

			var completeness = (1 - diffWordsNum / referenceWords.length) * 100;

			phraseDiv.innerHTML +=
				`[Overall Pronunciation result] Accuracy: ${accuracy}; 
                       Fluency: ${fluency};
                       Completeness: ${completeness}.\n`;
		}
	</script>

    <script>
		function doRecognizeOnceAsync() {
			resetUiForScenarioStart();

			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechConfig);
			if (!audioConfig || !speechConfig) return;

			reco = new SpeechSDK.SpeechRecognizer(speechConfig, audioConfig);
			applyCommonConfigurationTo(reco);

			reco.recognized = undefined;

			reco.recognizeOnceAsync(
				function (successfulResult) {
					onRecognizedResult(successfulResult);
				},
				function (err) {
					window.console.log(err);
					phraseDiv.innerHTML += "ERROR: " + err;
				});
		}

		function doContinuousRecognition() {
			resetUiForScenarioStart();

			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechConfig);
			if (!speechConfig) return;

			reco = new SpeechSDK.SpeechRecognizer(speechConfig, audioConfig);
			applyCommonConfigurationTo(reco);

			reco.startContinuousRecognitionAsync();
		}

		function doRecognizeIntentOnceAsync() {
			resetUiForScenarioStart();
			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechConfig);
			if (!audioConfig || !speechConfig) return;

			if (!appId.value) {
				alert('A language understanding appId is required for intent recognition.');
				return;
			}

			reco = new SpeechSDK.IntentRecognizer(speechConfig, audioConfig);
			var intentModel = SpeechSDK.LanguageUnderstandingModel.fromAppId(appId.value);
			reco.addAllIntents(intentModel);

			applyCommonConfigurationTo(reco);
			reco.recognizeOnceAsync();
		}

		function doContinuousTranslation() {
			resetUiForScenarioStart();

			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechTranslationConfig);
			if (!audioConfig || !speechConfig) return;

			reco = new SpeechSDK.TranslationRecognizer(speechConfig, audioConfig);
			applyCommonConfigurationTo(reco);

			reco.synthesizing = function (s, e) {
				var audioSize = e.result.audio === undefined ? 0 : e.result.audio.byteLength;

				statusDiv.innerHTML += `(synthesizing) Reason: ${SpeechSDK.ResultReason[e.result.reason]}`
					+ ` ${audioSize} bytes\r\n`;

				if (e.result.audio && soundContext) {
					var source = soundContext.createBufferSource();
					soundContext.decodeAudioData(e.result.audio, function (newBuffer) {
						source.buffer = newBuffer;
						source.connect(soundContext.destination);
						source.start(0);
					});
				}
			};

			reco.startContinuousRecognitionAsync();
		}

		function doPronunciationAssessmentOnceAsync() {
			resetUiForScenarioStart();

			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechConfig);
			var pronunciationAssessmentConfig = getPronunciationAssessmentConfig();
			if (!audioConfig || !speechConfig || !pronunciationAssessmentConfig) return;

			reco = new SpeechSDK.SpeechRecognizer(speechConfig, audioConfig);
			applyCommonConfigurationTo(reco);

			pronunciationAssessmentConfig.applyTo(reco);

			
			reco.recognized = undefined;

			reco.recognizeOnceAsync(
				function (successfulResult) {
					onRecognizedResult(successfulResult);
				},
				function (err) {
					window.console.log(err);
					phraseDiv.innerHTML += "ERROR: " + err;
				});
		}

		function doContinuousPronunciationAssessment() {
			resetUiForScenarioStart();

			var audioConfig = getAudioConfig();
			var speechConfig = getSpeechConfig(SpeechSDK.SpeechConfig);
			var pronunciationAssessmentConfig = getPronunciationAssessmentConfig();
			if (!speechConfig) return;

			reco = new SpeechSDK.SpeechRecognizer(speechConfig, audioConfig);
			applyCommonConfigurationTo(reco);

			pronunciationAssessmentConfig.applyTo(reco);

			reco.startContinuousRecognitionAsync();
		}
	</script>
</body>

</html>
