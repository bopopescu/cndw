# -*- coding: utf-8 -*- #
# Copyright 2016 Google LLC. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""The `gcloud compute shared-vpc associated-projects remove` command."""

from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals

from googlecloudsdk.api_lib.compute import xpn_api
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.compute.xpn import flags


class Remove(base.Command):
  """Disassociate the given project from the given shared VPC host project."""

  detailed_help = {
      'EXAMPLES':
          """
          To remove the project `service-project` as an associated shared VPC
          service project of the shared VPC host project `host-project`, run:

            $ {command} --host-project=host-project service-project
      """
  }

  @staticmethod
  def Args(parser):
    flags.GetProjectIdArgument(
        'remove from the host project').AddToParser(parser)
    flags.GetHostProjectFlag(
        'remove the associated project from').AddToParser(parser)

  def Run(self, args):
    xpn_client = xpn_api.GetXpnClient(self.ReleaseTrack())
    xpn_client.DisableXpnAssociatedProject(args.host_project, args.project)
